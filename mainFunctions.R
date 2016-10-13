splitFn<-function(user.id){
  user.game.list<-unique(events[events$userID==user.id,]$partApp)
  return(split(events[events$userID==user.id,],factor(events[events$userID==user.id,]$partApp)))
}
