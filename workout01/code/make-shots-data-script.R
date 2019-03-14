
#title: Shot Data Script
#description: A script of data preparation and brief summary
#input(s): The performance of 5 GSW players in the games
#output(s): Summary of the performance of 5 players respectively and stacked tables.

#Read in the five data sets, using relative file paths
curry <- read.csv("../data/stephen-curry.csv", stringsAsFactors = FALSE)
thompson <- read.csv("../data/klay-thompson.csv", stringsAsFactors = FALSE)
durant <- read.csv("../data/kevin-durant.csv", stringsAsFactors = FALSE)
green <- read.csv("../data/draymond-green.csv", stringsAsFactors = FALSE)
iguodala <- read.csv("../data/andre-iguodala.csv", stringsAsFactors = FALSE)

#Add a column name to each imported data frame, that contains the name of the corresponding player:
curry$name <- c('Stephen Curry')
thompson$name <- c('Klay Thompson')
durant$name <- c('Kevin Durant')
green$name <- c('Draymond Green')
iguodala$name <- c('Andre Iguodala')

#Change the original values of shot_made_flag to more descriptive values
curry$shot_made_flag[curry$shot_made_flag=='y']  <- 'shot_yes'
curry$shot_made_flag[curry$shot_made_flag=='n']  <- 'shot_no'
thompson$shot_made_flag[thompson$shot_made_flag=='y']  <- 'shot_yes'
thompson$shot_made_flag[thompson$shot_made_flag=='n']  <- 'shot_no'
durant$shot_made_flag[durant$shot_made_flag=='y']  <- 'shot_yes'
durant$shot_made_flag[durant$shot_made_flag=='n']  <- 'shot_no'
green$shot_made_flag[green$shot_made_flag=='y']  <- 'shot_yes'
green$shot_made_flag[green$shot_made_flag=='n']  <- 'shot_no'
iguodala$shot_made_flag[iguodala$shot_made_flag=='y']  <- 'shot_yes'
iguodala$shot_made_flag[iguodala$shot_made_flag=='n']  <- 'shot_no'

#Add a column minute that contains the minute number where a shot occurred.
curry$minute <- curry$period*12 - curry$minutes_remaining
thompson$minute <- thompson$period*12 - thompson$minutes_remaining
durant$minute <- durant$period*12 - durant$minutes_remaining
green$minute <- green$period*12 - green$minutes_remaining
iguodala$minute <- iguodala$period*12 - iguodala$minutes_remaining

#Use sink() to send the summary() output of each imported data frame into individuals text files
sink(file = '../output/stephen-curry-summary.txt')
summary(curry)
sink()

sink(file = '../output/klay-thompson-summary.txt')
summary(thompson)
sink()

sink(file = '../output/kevin-durant-summary.txt')
summary(durant)
sink()

sink(file = '../output/draymond-green-summary.txt')
summary(green)
sink()

sink(file = '../output/andre-iguodala-summary.txt')
summary(iguodala)
sink()

#Use the row binding function rbind() to stack the tables into one single data frame
shots <- rbind(curry,thompson,durant,green,iguodala)

#Export (i.e. write) the assembled table as a CSV file shots-data.csv inside the folder data/
write.csv(shots, file = "../output/shots-data.csv")

#Use sink() to send the summary() output of the assembled table
sink(file = '../output/shots-data-summary.txt')
summary(shots)
sink()