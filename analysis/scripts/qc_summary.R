library(tidyverse)
args=commandArgs(TRUE)
css=read_tsv(args[1])
#css = css %>% filter(sample %in% c('Zymo-GridION-EVEN-BB-SN', 'Zymo-GridION-LOG-BB-SN', 'Zymo-PromethION-EVEN-BB-SN', 'Zymo-PromethION-LOG-BB-SN')) 
css = css %>% filter(!is.na(sequence_length_template))

css = css %>% mutate(platform=ifelse(grepl('GridION', sample), 'GridION', 'PromethION'))

css = css %>% mutate(hour=cut(start_time/60/60, breaks=c(0,6,12,18,24,30,36,42,48,54,60,Inf), labels=c("0-5", "6-11", "12-17", "18-23", "24-29", "30-35", "36-41", "42-47", "48-53", "54-59", "60+")))

print(css %>% group_by(sample) %>% summarise(m=mean(sequence_length_template/duration), md=median(sequence_length_template/duration)))


p=ggplot(css, aes(x=sequence_length_template/duration, color=sample, fill=sample)) + geom_density() + scale_x_continuous("Mean duration (s)") + theme_bw(base_size=16)
ggsave("duration_with_legend.png", width=20, height=6)
ggsave("duration_with_legend.pdf", width=20, height=6)

# cumplot

css2 = css %>% group_by(sample) %>% arrange(start_time) %>% mutate(yield=cumsum(as.numeric(sequence_length_template))) %>% sample_n(100000)
p=ggplot(css2, aes(x=start_time/60/60, y=yield/1000/1000/1000, color=sample)) + geom_line(alpha=1/2, size=2) + theme_bw(base_size=16) + scale_colour_discrete(guide = guide_legend()) + theme(legend.position="bottom") + scale_x_continuous("Hours") + scale_y_continuous("Gigabases")

ggsave("yield.png")
ggsave("yield.pdf")

p=ggplot(filter(css, !is.na(hour)), aes(x=hour, y=sequence_length_template/duration, fill=sample)) + geom_violin() + facet_wrap(~platform, ncol=1) + theme_bw(base_size=16) + scale_y_continuous("Duration (seconds)") + scale_x_discrete("Time (hours)") +  scale_fill_discrete(guide = guide_legend()) + theme(legend.position="bottom")
ggsave("duration_violin.png")
ggsave("duration_violin.pdf")

p=ggplot(css, aes(x=sequence_length_template/duration, color=sample, fill=sample)) + geom_density() + scale_x_continuous("Mean duration (s)") + theme_bw(base_size=16) + theme(legend.position="none")
ggsave("duration.png")
ggsave("duration.pdf")

p=ggplot(css, aes(x=sequence_length_template/duration, color=sample, fill=sample)) + geom_density() + scale_x_continuous("Mean duration (s)") + theme_bw(base_size=16) 
ggsave("duration_with_legend.png", width=20, height=6)
ggsave("duration_with_legend.pdf", width=20, height=6)

p2=ggplot(css, aes(x=sequence_length_template, color=sample)) + geom_density() + scale_x_continuous("Read length") + xlim(0,30000) + theme_bw(base_size=16)

p2=ggplot(css, aes(x=sequence_length_template, color=sample)) + geom_density() + scale_x_continuous("Read length") + xlim(0,30000) + theme_bw(base_size=16)
ggsave("readlength.png")
ggsave("readlength.pdf")

