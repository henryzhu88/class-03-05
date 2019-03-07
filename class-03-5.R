install.packages(gapminder)
library(gapminder)
library(tidyverse)
install.packages("gganimate")
library(gganimate)
gapminder%>%
  filter(year==1952, continent %in% c("Americas","Africa","Asia"))%>%
  mutate(continent=fct_collapse(continent,Asia=c("Asia","Oceania")))%>%
  ggplot(aes(x=log10(gdpPercap), y= lifeExp,size=pop,color = country)) + geom_point(alpha=0.5,show.legend = FALSE)+
           facet_wrap(~continent)
  
