#Coding general ETL, job graph
#V1.00, created le 05/10/16

#------------------------------------------------------------------------------------------------
#DEFINING FUNCTIONS
#------------------------------------------------------------------------------------------------
#Verifying integrity of events using luhn algorithm
#Parameter string event
#Process
#converting string event to numerical event ?
#Return boolean value
verifIntegrity <- function(vector){
  #only use key to verify integrety
  #check length
  b_integrity = TRUE
  return(b_integrity)
}

#ParseEvent
#parsing and storing data in the dataframe
parseEvent <- function(file_content){
  user.id <- substr(file_content, 1,9)
  app.version <- substr(file_content, 10,13)
  app.part <- substr(file_content, 14, 17)
  screen.id <- substr(file_content, 18, 20)
  event.data <- substr(file_content, 21, 27)
  coordinate <- substr(file_content, 28, 35)
  time <- substr(file_content, 36, 49)
  key <- substr(file_content, 50, 52)
  return (c(user.id,
            app.version,
            app.part,
            screen.id,
            event.data,
            coordinate,
            time,
            key))
}

#Function extractEventString
#Parameters# file_name type character
#Return# list corresponding to parse data event
#Procedure
#1# Read file stored in df as character array
#2# Extract the stored character array in a string type variable
#3# Verify the integrity of the data using the function 'verifIntegrity()'
#4# Parse the string regarding the event structure using 'parseEvent()'
#5# Return
#*# If integrity false -> print a log then go to next file
extractEvents <- function(files){
  df_file_content = read.csv(file = files, colClasses=c('character'))
  character_file_content = df_file_content[,1]
  if (verifIntegrity()){
    #parse content
    return(parseEvent(file_content = character_file_content))
  }
  else{
    #On retourne un log d'error
  }
}

loadToMatrix <- function(folderPathToExtract){
  files <- list.files(path=folderPathToExtract,pattern="*.csv", full.names = TRUE)
  event.list <- lapply(files, extractEvents)
  event.matrix <- matrix(data = unlist(event.list), nrow = length(event.list), byrow = T)
  return(event.matrix)
}

changeLevels<-function(dataframe){
  dataframe$screenId = as.numeric(dataframe$screenId)
  levels(dataframe$screenId)=c('introduction','feedbacks','memorization','game','reading','multipleChoice','yesNo')
  return(dataframe)
}
#------------------------------------------------------------------------------------------------
#MAIN FUNCTION
#------------------------------------------------------------------------------------------------

load.main <- function(){
  foldersPath.list <- list.dirs(LOCAL_PATH, full.names = TRUE, recursive = FALSE)
  events.matrix.list<-lapply(foldersPath.list,loadToMatrix)
  events.combineMatrix <- do.call(rbind,events.matrix.list)
  event.dataframe <- data.frame(events.combineMatrix, stringsAsFactors=FALSE)
  names(event.dataframe)<- c("userID","versionApp","partApp","screenID","eventData","cordinate","time","key")
  event.dataframe$time <- as.POSIXct(event.dataframe$time,format="%Y%m%d%H%M%S")
  #event.dataframe$screenId<-factor(event.dataframe$screenId,labels = c('introduction','feedbacks','memorization','game','reading','multipleChoice','yesNo'))
  return(event.dataframe)
}