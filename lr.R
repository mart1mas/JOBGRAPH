#Coding general lighting room metrics, job graph
#V1.00, created le 11/10/16 by RD&&MM
#------------------------------------------------------------------------------------------------
#VARIABLES
#------------------------------------------------------------------------------------------------
game_name="lighting room"
#------------------------------------------------------------------------------------------------
#FUNCTIONS
#------------------------------------------------------------------------------------------------
parserEvent<-function(screenID, eventString){
  eventState=""
  return(eventState)
}
sessionBreaker<-function(game, screenID){
  b <- FALSE
  if(game==APP_PART["lighting room"]&screenID=="feedback") b <- TRUE
  return(b)
}

#------------------------------------------------------------------------------------------------
#MAIN
#------------------------------------------------------------------------------------------------
lr.main <- function(user.id){
  #Récupère la df du game pour le joueur user.id
  df.tmp<-events.user.game[[user.id]][[APP_PART[game_name]]]
  #Ordering per time event
  df.tmp<-df.tmp[order(df.tmp$time),]
  #checking if user has played
  if (is.data.frame(df.tmp)){
    for(i in 1:lenght(df.tmp)){
      #memorizing last feedback
      while(!sessionBreaker(game_name,df.tmp[i,"screenId"])){
        
      }
      #finding session number
      #lors de la rencontre
      #initialiser une liste avec id separateurs entre session
        i_id = c()
        #Initializing variables for each play
        #tap_good = 0
        #tap_bad = 0
        #Cases per event....
        #Complete list 
      }
      lapply(liste des séparateurs)
    }
  }
}

