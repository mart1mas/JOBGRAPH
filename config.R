#GLOBAL ENV VALUES
#-----------------------------------------------------------------------------------------------
LOCAL_PATH = file.path(getwd(),"EXTRACT")
APP_PART = c("0001",
             "0002",
             "0003",
             "0004",
             "0005",
             "0006",
             "0007",
             "0008",
             "0009",
             "0010",
             "0011",
             "0012",
             "0013",
             "0014",
             "0015",
             "0016",
             "0017",
             "0018")
names(APP_PART)=c("waiting screen",
                  "login",
                  "metro map",
                  "uboat",
                  "lighting room",
                  "magic mirror",
                  "soul labelling",
                  "storyteller",
                  "negotiator",
                  "mad series",
                  "crazy pipe",
                  "moral dilemna",
                  "soul labelling",
                  "rocket launcher",
                  "numerical game",
                  "yes or no questions",
                  "motivation",
                  "personality")
GAME_LIST=APP_PART[c(4:18)]
APP_SCREEN=c("001","002","003","004","005","006","007")
names(APP_SCREEN)=c("introduction","feedback","memorization","game","reading","multiple choice","yes no question")
#------------------------------------------------------------------------------------------------
