library(ggalluvial)
library(ggplot2)
library(viridis)
library(RColorBrewer)
library(reshape2)
library(tidyverse)
library(magrittr)
#df1 <- readxl::read_excel("./第10章 网络关系型图表/data/流动桑基图数据.xlsx")
#df1 <- readxl::read_excel("./第10章 网络关系型图表/data/流动桑基图数据0712.xlsx", sheet = 1)
df1 <- readxl::read_excel("./第10章 网络关系型图表/data/流动桑基图数据0712.xlsx", sheet = 2)
head(df1)

df1 %>% summary()
#df1 %<>% select(V1_cluster,V2_cluster,V3_cluster)

df1 %<>% select(V1_cluster,V3_cluster)

#df1 %>% count(V1,V2,V3)
# # A tibble: 121 × 4
# V1    V2    V3     n
# <dbl> <dbl> <dbl> <int>
#   1     1     1     1    12
# 2     1     1     4     1
# 3     1     1     6     1
# 4     1     2     1     4
# 5     1     2     2     3
# 6     1     2     5     1
# 7     1     2     6     1
# 8     1     3     2     2
# 9     1     4     1     6
# 10     1     4     4    14
# # … with 111 more rows

df1a <- to_lodes_form(df1[,1:ncol(df1)],
                      axes = 1:ncol(df1),
                      id = "group")
dim(df1a)
tail(df1a)

mycolor <- colorRampPalette(brewer.pal(9,'YlGnBu'))(13)
ggplot(df1a,
       aes(x = x,#weight = weight,
           stratum = stratum, alluvium = group,
           fill = stratum, label = stratum)) +
  geom_flow(alpha = 0.7,width=0.25,color = "darkgray") +
  geom_stratum(alpha =1,width=0.25) +
  geom_text(stat = "stratum", size = 3.5,angle=0) +
  scale_fill_manual(values= mycolor)+   #values=mycolor)+
  theme_test()+
  theme(legend.position = "none",
        axis.text.y =element_blank(),
        axis.line = element_blank(),
        axis.ticks =element_blank() )

