#Coding general numerical literacy metrics, job graph
#V1.00, created le 10/10/16
#------------------------------------------------------------------------------------------------
#VARIABLES
#------------------------------------------------------------------------------------------------
nl.app_part <- "0021"


#------------------------------------------------------------------------------------------------
#FUNCTIONS
#------------------------------------------------------------------------------------------------
roughMetrics<-function(list or matrix of events per question){
  
}

myFunction <- function(userID){
  #nl events per userID
  nl.events.user <- events[events$userID==userID & events$partApp==nl.app_part,]
  #Sorting the events by date
  nl.events.user <- nl.events.user[order(nl.events.user$time),]
  
  return(nl.metrics.user.matrix)
}

#------------------------------------------------------------------------------------------------
#MAIN
#------------------------------------------------------------------------------------------------
nl.main <- function(){
  user.list <- unique(events$userID)
  #List of matrix per user's metrics
  nl.metrics.user.matrix.list <- lapply(user.list,myfunction)
  #Matrix to df
  return(nl.metrics)
}
