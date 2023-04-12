## Hands-on 1
library(gapminder)
library(tidyverse)
library(ggrepel)
library(socviz)

# Considering American Sociological Association Section Membership dataset (asasec), For 2013 show the relatioship between members and revenues and also cosider different colors for having journal. Use the linear prediction line.
head(asasec)

asasec <- asasec


p <- ggplot(data = subset(asasec, Year == 2013),
            mapping = aes(x = Members, y = Revenues, label = Sname))

p + geom_point(mapping = aes(color = Journal))+
                       geom_smooth(method = "lm")

## Hands-on 2
# Lebel those outliers with revenue bigger than $10,000

p0 <- ggplot(data = subset(asasec, Year == 2013),
             mapping = aes(x = Members, y = Revenues, label = Sname))

p1 <- p0 + geom_smooth(method = "lm", se = FALSE, color = "gray80") +
  geom_point(mapping = aes(color = Journal)) 

p1

p1 + geom_smooth()

#  ... and add some text labels...
p2 <- p1 + 
  geom_text_repel(data=subset(asasec, Year == 2014 & Revenues > 10000), size = 4)
p2

#  ... and graph labels...
p3 <- p2 + labs(x="Membership",
                y="Revenues",
                color = "Section has own Journal",
                title = "ASA Sections",
                subtitle = "2013 Calendar year.",
                caption = "Source: ASA annual report.")

p3

p4 <- p3 + scale_y_continuous(labels = scales::dollar) +
  theme(legend.position = "bottom")
p4

## Hands-on 3
# Revise the code below to use *Accent* for color
p <- ggplot(data = organdata,
            mapping = aes(x = roads, y = donors, color = world))

p + geom_point(size = 1.5) +
  scale_color_brewer(palette = "Accent") +
  theme(legend.position = "top")


## Hands-on 4
# Find Lehigh university and Rutgers University color codes and dispaly it here 

cb_palette_1 <- c("#653819" , "#FED141" , "#CC0033" , "#5F6A72")
                         
color_comp(cb_palette_1)


