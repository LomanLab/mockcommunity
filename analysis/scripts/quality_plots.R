library(tidyverse)

args=commandArgs(TRUE)
quals=read_tsv(args[1], col_names=F)

quals = quals %>% mutate(platform=ifelse(grepl('GridION', X1), 'GridION', 'PromethION')) %>% mutate(abbrevsample=ifelse(grepl('EVEN', X1), 'Even', 'Log'))

p=ggplot(quals, aes(x=100*X3, fill=X1, colour=X1)) + geom_density() + facet_grid(platform ~ abbrevsample) + theme_bw(base_size=10) + guides(fill=FALSE) + scale_x_continuous(name="Accuracy (%)", limits=c(50, 100))

ggsave("quals.pdf", width=6, height=6) 

