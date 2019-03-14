#title: Shot Charts
#description: Shot Charts of 5 players in GSW of 2016 season
#inputs: The performance of 5 GSW players in the games
#outputs: Shot Charts of 5 players in GSW of 2016 season in pdf and png files

library(ggplot2)
library(grid)
library(jpeg)
#scatterplot
Klay_scatterplot <- ggplot(data = thompson) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag))
#court image
court_file <- "../images/nba-court.jpg"
#create raste object
court_image <- rasterGrob( 
  readJPEG(court_file), 
  width = unit(1, "npc"), 
  height = unit(1, "npc"))
#shot chart with court background
klay_shot_chart <- ggplot(data = thompson) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) +
  ggtitle('Shot Chart: Klay Thompson (2016 season)') + theme_minimal()
#4.1) Shot charts of each player
iguodala_shot_chart <- ggplot(data = iguodala) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) +
  ggtitle('Shot Chart: Andre Iguodala (2016 season)') + theme_minimal()
ggsave('../images/andre-iguodala-shot-chart.pdf', plot = iguodala_shot_chart, device = "pdf", width = 6.5, height = 5)

green_shot_chart <- ggplot(data = green) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) +
  ggtitle('Shot Chart: Draymond Green (2016 season)') + theme_minimal()
ggsave('../images/draymond-green-shot-chart.pdf', plot = green_shot_chart, device = "pdf", width = 6.5, height = 5)

durant_shot_chart <- ggplot(data = durant) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) +
  ggtitle('Shot Chart: Kevin Durant (2016 season)') + theme_minimal()
ggsave('../images/kevin-durant-shot-chart.pdf', plot = durant_shot_chart, device = "pdf", width = 6.5, height = 5)

thompson_shot_chart <- ggplot(data = thompson) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) +
  ggtitle('Shot Chart: Klay Thompson (2016 season)') + theme_minimal()
ggsave('../images/klay-thompson-shot-chart.pdf', plot = thompson_shot_chart, device = "pdf", width = 6.5, height = 5)

curry_shot_chart <- ggplot(data = curry) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) +
  ggtitle('Shot Chart: Stephen Curry (2016 season)') + theme_minimal()
ggsave('../images/stephen-curry-shot-chart.pdf', plot = curry_shot_chart, device = "pdf", width = 6.5, height = 5)

#4.2) Facetted Shot Chart
GSW_shot_charts <- ggplot(data = shots) +
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) +
  ggtitle('Shot Charts:GSW (2016 season)') + theme_minimal() +
  facet_wrap(~ name)

ggsave('../gsw-shot-charts.pdf', GSW_shot_charts, device = "pdf", width = 8, height = 7)
ggsave('../gsw-shot-charts.png', GSW_shot_charts, device = "png", width = 8, height = 7)
