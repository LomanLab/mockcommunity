library(tidyverse)
library(gtools)

# from https://gist.github.com/shujishigenobu/1858458 by shujishigenobu
N50 <- function(x) {
    x.sorted <- rev(sort(x))
    return(x.sorted[cumsum(x.sorted) >= sum(x.sorted)*0.5][1])
}

args=commandArgs(T)
statsfn = args[1]
metadata = args[2]
prefix = args[3]

st=read_tsv(statsfn)

abundance_metadata=read_tsv(paste0("refs/",metadata,".txt"), comment="#")

a=st %>% group_by(Genome) %>% 
         summarise(n=n(),
                   bases=sum(ALen/1),
                   meanlen=mean(ALen),
                   medianlen=median(ALen),
                   maxlen=max(ALen),
                   N50=N50(ALen))

sources=read_tsv("refs/sources.txt", comment="#")
b=inner_join(a, sources, by=c("Genome"="Abbrev"))
b=inner_join(b, abundance_metadata, by=c("Genome"="Abbrev"))

total=sum(b$bases)
c=b %>% mutate(Sample = prefix) %>%
        mutate(Cov = bases/GenomeSize) %>%
        mutate(Perc = bases/total * 100) %>%
        mutate(FoldChange = foldchange(Perc, Expected)) %>%
        arrange(Perc)
   
print(c)
write_tsv(c %>% select(Genome, bases, meanlen, medianlen, N50, maxlen, Cov, Perc, Expected, FoldChange, CellType), paste0(prefix,"_stats.tsv"))

print(c%>%select(Genome,bases,N50,Cov,Perc,Expected,FoldChange,CellType))

p=ggplot(c, aes(x=Genome, y=FoldChange, fill=CellType)) + geom_bar(stat="identity")
ggsave(paste0(prefix,"_","foldchange.pdf"), p)

