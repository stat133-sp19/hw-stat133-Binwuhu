Workout1
================
Binwu Hu
03/13/2019

**Hampton Five ---- the "Death Lineup" of GSW**
-----------------------------------------------

<img src="../images/hampton-five.png" width="100%" style="display: block; margin: auto;" />

### **Backround and Motivation**

The commonly know **"Hampton Five"** is the Warriors lineup of [Steph Curry](https://en.wikipedia.org/wiki/Stephen_Curry), [Klay Thompson](https://en.wikipedia.org/wiki/Klay_Thompson), [Andre Iguodala](https://en.wikipedia.org/wiki/Andre_Iguodala), [Kevin Durant](https://en.wikipedia.org/wiki/Kevin_Durant) and [Draymond Green](https://en.wikipedia.org/wiki/Draymond_Green). Death Lineup is a group of smaller basketball players on the [Golden State Warriors](https://en.wikipedia.org/wiki/Golden_State_Warriors) of the National Basketball Association (NBA). Developed under head coach [Steve Kerr](https://en.wikipedia.org/wiki/Steve_Kerr), it began during their 2014–15 run that led to an NBA championship.

Is this the greatest lineup in the history of the league? <img src="../images/highest-effective.jpg" width="60%" style="display: block; margin: auto auto auto 0;" />

Since the Warriors' effective field-goal percentage of 58.5 percent is the highest mark in NBA history, we are wondering how the "Hampton Five" contribute to the shooting performance of the team. In this article, we try to analyse the shooting performance of five players in both visual and quantitative way.

### **Introduction**

<img src="../images/gsw-position.png" width="80%" style="display: block; margin: auto;" />

**Point Guard**: Greatest shooter of all time. 2x MVP. Only unanimous MVP ever. 5x All Star. 5x All Nba. Solid on defense. In his prime.

**Shooting Guard**: Top 10 shooter of all time. 4x All Star. 2x All Nba. Can get hotter then any player in the history of the game ( 37 point quarter, 60 point half, Game 6 vs OKC, all with super high efficiency). Excellent defender and excellent size at 6'7". Can guard 3 positions and switch on smaller power forwards. One of the best spot up shooters of all time. In his prime.

**Small Forward**: Finals MVP. All Star. 2x All Defense. Still an explosive athlete at 33. Incredible BBIQ and defender. Super smart passer (4 to 1 assist to turnover ration the last 4 years). Great size at 6'7" and ability to guard 3 positions.

**Power Forward**: Top 5 scorer of all time. MVP. Finals MVP. 4x Scoring Champions. 9x All Star. 8x All Nba. Absolutely elite in every phase of scoring: 3 pointers, free throws, mid range, driving, transition, post up. Career averages are basically 50/40/90 shooting splits. 7 foot monster with guard handle. Top 5 in blocks and is quick enough to switch on point guards (guarded Jrue Holiday the entire series). In his prime.

**Center**: DPOTY. 3x All Star. 2x All Nba. 3x All defense. Absolutely elite defender who can guard all 5 positions at a high level. BBIQ on defense is unmatched. On offense he is an excellent passer ( \#2 APG for non Guards in the league) and enough of a threat from the 3 point line. In his prime.

### **Data**

In order to analyse the five players' performance in a quantitative way, we use the [data of season 2016](https://github.com/ucb-stat133/stat133-hws/tree/master/data) that records the shooting performance of these players.

The dataset that we used includes these variables for the sake of further analaysis:

<table style="width:92%;">
<colgroup>
<col width="9%" />
<col width="15%" />
<col width="66%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Data Name</th>
<th align="left">Data Type</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><strong>team_name</strong></td>
<td align="left">character</td>
<td align="left">Name of the team that the player is currently in</td>
</tr>
<tr class="even">
<td align="left"><strong>game_data</strong></td>
<td align="left">character</td>
<td align="left">The date of the game</td>
</tr>
<tr class="odd">
<td align="left"><strong>season</strong></td>
<td align="left">integer</td>
<td align="left">The season(year) of the game</td>
</tr>
<tr class="even">
<td align="left"><strong>period</strong></td>
<td align="left">integer</td>
<td align="left">An NBA game is divided in 4 periods of 12 mins each</td>
</tr>
<tr class="odd">
<td align="left"><strong>minutes_remaining</strong></td>
<td align="left">numeric</td>
<td align="left">Amount of time in minutes that remained to be played in a given period</td>
</tr>
<tr class="even">
<td align="left"><strong>seconds_remaining</strong></td>
<td align="left">numeric</td>
<td align="left">Amount of time in seconds that remained to be played in a given period</td>
</tr>
<tr class="odd">
<td align="left"><strong>shot_made_flag</strong></td>
<td align="left">character</td>
<td align="left">Whether a shot was made (y) or missed (n)</td>
</tr>
<tr class="even">
<td align="left"><strong>action_type</strong></td>
<td align="left">character</td>
<td align="left">The basketball moves used by players, either to pass by defenders to gain access to the basket, or to get a clean pass to a teammate to score a two pointer or three pointer</td>
</tr>
<tr class="odd">
<td align="left"><strong>shot_type</strong></td>
<td align="left">character</td>
<td align="left">Whether a shot is a 2-point field goal, or a 3-point field goal</td>
</tr>
<tr class="even">
<td align="left"><strong>shot_distance</strong></td>
<td align="left">numeric</td>
<td align="left">Distance to the basket (measured in feet)</td>
</tr>
<tr class="odd">
<td align="left"><strong>opponent</strong></td>
<td align="left">character</td>
<td align="left">The opponent team of the game</td>
</tr>
<tr class="even">
<td align="left"><strong>x</strong></td>
<td align="left">numeric</td>
<td align="left">The court coordinates(measured in inches) where a shot occurred</td>
</tr>
<tr class="odd">
<td align="left"><strong>y</strong></td>
<td align="left">numeric</td>
<td align="left">The court coordinates(measured in inches) where a shot occurred</td>
</tr>
</tbody>
</table>

### **Overall Analysis**

According to this dataset, we plot the shooting performance for "Hampton Five" respectively: <img src="../images/gsw-shot-charts.png" width="100%" style="display: block; margin: auto;" />

From the above, we can easily notice that Klay Thompson and Stephen Curry gave more shots in the games of 2016 season, While Andre Iguodala gave relatively fewer shots in the games. These plots also indicate some shooting features of each player, like roughly half of shots made by Draymond Green are around the three-point line.

### **Further Discussion**

Apart from the number of shooting, how accurate are these shots made by players? In another word, how effective are these shots of each player?In order to figure out this problem, we use the variable "perc\_made" to evaluate the percentage of the effective shooting of each player.

#### **2PT Effective Shooting % by Player**

| name           |  total|  made|  perc\_made|
|:---------------|------:|-----:|-----------:|
| Andre Iguodala |    210|   134|   0.6380952|
| Kevin Durant   |    643|   390|   0.6065319|
| Stephen Curry  |    563|   304|   0.5399645|
| Klay Thompson  |    640|   329|   0.5140625|
| Draymond Green |    346|   171|   0.4942197|

From this figure, we can easily see that Klay Thompson and Kevin Durant made higher 2PT shooting in the games, while Kevin Durant's Effective shooting percentage is relatively higher than Thompson. Also, Andre Iguodala made fewer shots yet possesses the highest effective shooting percentage. Kevin Durant made more than a half shootings inside the three-point line.

#### **3PT Effective Shooting % by Player**

| name           |  total|  made|  perc\_made|
|:---------------|------:|-----:|-----------:|
| Klay Thompson  |    580|   246|   0.4241379|
| Stephen Curry  |    687|   280|   0.4075691|
| Kevin Durant   |    272|   105|   0.3860294|
| Andre Iguodala |    161|    58|   0.3602484|
| Draymond Green |    232|    74|   0.3189655|

From this figure, we notice that regarding 3-point shooting roughly two thirds of shooting in the "Hampton Five". Also, they two have the higher effective shooting percentage.

#### **Effective Shooting % by Player**

| name           |  total|  made|  perc\_made|
|:---------------|------:|-----:|-----------:|
| Kevin Durant   |    915|   495|   0.5409836|
| Andre Iguodala |    371|   192|   0.5175202|
| Klay Thompson  |   1220|   575|   0.4713115|
| Stephen Curry  |   1250|   584|   0.4672000|
| Draymond Green |    578|   245|   0.4238754|

Klay Thompson and Stephen Curry no doubt made the remarkable number of shooting in the 2016 season. Kevin Durant has the highest effective shooting percentage which is more than 50%.

### **Conclusion**

Shooting is the most important thing in basketball. The Warriors do it more effectively than any other team in history. The "Hampton Five" contributes tremendously to this remarkable success. According to the previous data and analysis above, **Stephen Curry** and **Klay Thompson** who have highest number of shots and effective shooting over 50 percentage are no doubt the great contributor to the success of GSW.

Is this the greatest lineup in the history of the league? I think it is. They have three elite defenders in Iguodala, Green and Thompson. Three elite shooters in Thompson, Durant and, of course, Steph Curry. And They have four players who have averaged at least five assists in a season.

These five can pass, shoot and defend at an elite level. There’s no such thing as the perfect lineup, but this is the closest they’ll ever get to it.

### **References**

[The Warriors new 'Death Lineup' is going to terrorize the NBA](https://ftw.usatoday.com/2016/07/golden-state-warriors-death-lineup-kevin-durant)

[Hampton's 5 is the greatest starting lineup of All Time.](https://www.reddit.com/r/nba/comments/8i8gv6/hamptons_5_is_the_greatest_starting_lineup_of_all/)

[Wikipedia----Death Lineup](https://en.wikipedia.org/wiki/Death_Lineup)

[One Team, One Stat -- Golden State Warriors' shooting the best in NBA history ... again](https://www.nba.com/article/2017/12/14/one-team-one-stat-warriors-shooting-better-ever)

[5 Wild Stats Defining Golden State Warriors' Season](https://bleacherreport.com/articles/2749739-5-wild-stats-defining-golden-state-warriors-season#slide2)
