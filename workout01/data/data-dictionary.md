
## Data Dictionary

###Here's the description of the data variables:

Data Name|Data Type|Description
-----|:---------|:----------------------------------------------
**team_name**|character|Name of the team that the player is currently in
**game_data**|character|The date of the game
**season**|integer|The season(year) of the game
**period**|integer|An NBA game is divided in 4 periods of 12 mins each
**minutes_remaining**|numeric|Amount of time in minutes that remained to be played in a given period
**seconds_remaining**|numeric|Amount of time in seconds that remained to be played in a given period
**shot_made_flag**|character|Whether a shot was made (y) or missed (n)
**action_type**|character|The basketball moves used by players, either to pass by defenders to gain access to the basket, or to get a clean pass to a teammate to score a two pointer or three pointer
**shot_type**|character|Whether a shot is a 2-point field goal, or a 3-point field goal
**shot_distance**|numeric|Distance to the basket (measured in feet)
**opponent**|character|The opponent team of the game
**x**|numeric|The court coordinates(measured in inches) where a shot occurred
**y**|numeric|The court coordinates(measured in inches) where a shot occurred
**Reference**:[dimensions of an NBA basketball court](https://www.sportsknowhow.com/basketball/dimensions/nba-basketball-court-dimensions. html) 
