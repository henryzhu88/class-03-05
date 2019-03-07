install.packages(gapminder)
library(gapminder)
library(tidyverse)
install.packages("gganimate")
library(gganimate)

gapminder$continent=factor(gapminder$continent, levels=c("Americas","Africa", "Asia"))
                           
gapminder%>%
  filter(year==1952, continent %in% c("Americas","Africa","Asia"))%>%
  mutate(continent=fct_collapse(continent,Asia=c("Asia","Oceania")))%>%
  ggplot(aes(x=gdpPercap, y= lifeExp,size=pop,color = country)) + geom_point(alpha=0.5,show.legend = FALSE)+
           facet_wrap(~continent)+
  scale_x_log10(breaks=c(1000, 10000),
                labels=c("$1,000", "$10,000"))+
  labs(title="The World Gets Better Every Year:", caption="Source:gapminder package")+
  xlab("GDP Per Capita")+
  ylab("Life Expectancy")+
  scale_y_continuous(breaks = seq(40, 80, by = 20),
                     labels = c("40", "60","80"),
                     limits = c(20, 85))+
  scale_color_manual(values = country_colors)+
  gganimate()
  