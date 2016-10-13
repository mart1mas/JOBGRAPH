#------------------------------------------------------------------------------------------------------------
#MAIN PROGRAM FOR EXTRACT TRANSFORM AND LOAD PROCESS
#------------------------------------------------------------------------------------------------------------
#Created 16/10/06 by RD&MM
#------------------------------------------------------------------------------------------------------------
#POTENTIAL UPDATES
#------------------------------------------------------------------------------------------------------------
# - Reduce number of columns in the list
#------------------------------------------------------------------------------------------------------------


source("config.R")
source("load.R")
source("nl.R")
source("lr.R")
source("mainFunctions.R")



events <- load.main()
user.list <- unique(x = events$userID)
#Creating bucket per game per user
events.user.game<-lapply(user.list, splitFunction)

#renaming bucket per user game
names(events.user.game)<-user.list

#idea #2 computing metrics per game
#Browsing through games
metrics <- lapply(GAME_LIST, metric.main)


#idea #1 traiter user per user 
nl.metrics.user <- lapply(user.list, lr.main)
