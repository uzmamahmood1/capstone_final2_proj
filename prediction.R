clean_input <- function(x){
  work <- tolower(x)
  work <- gsub("[[:punct:]]", "", work)
  work <- gsub("+\\d+", "", work)
  work <- gsub("^ *|(?<= ) | *$", "", work, perl=T)
  return(work)
}

# 
# twitter prediction function 
#
setwd("C:/Users/Bruker/Desktop/datascience/Capstone_proj")
twitter_predict <- function(x) {
  
  # load dataset
  twitter_lookup <- read.csv(file = "twitter_lookup.csv",stringsAsFactors = FALSE)
  default <- twitter_lookup[twitter_lookup$length == 1,8]
  
  # clean input
  work <- clean_input(x)
  
  #split x into n1, n2, n3, and n4 length strings
  chopped <- strsplit(work," ")
  howlong <- length(chopped[[1]])
  if(howlong < 3) { maxcount <- howlong} else { maxcount <- 3}
  
  for(i in 1:maxcount) {
    nam <- paste("n",i,"_search",sep = "")
    assign(nam,chopped[[1]][howlong+1-i])
  }
  
  #search for a 3gram
  if(maxcount > 2) {
    n3_search <- paste(n3_search,n2_search,n1_search,sep =" ")
    
    n3_full <- twitter_lookup[twitter_lookup$less1gram == n3_search,]
    if(nrow(n3_full)<1) {n3_next <- c(0,default)} else {n3_next <- n3_full[1,7:8]}
    
  } else { n3_next <- c(0,default)}
  
  #search for a 2gram
  if(maxcount > 1) {
    n2_search <- paste(n2_search,n1_search,sep =" ")
    
    n2_full <- twitter_lookup[twitter_lookup$less1gram == n2_search,]
    if(nrow(n2_full)<1) {n2_next <- c(0,default)} else {n2_next <- n2_full[1,7:8]}
    
  } else { n2_next <- c(0,default)}
  
  #search for a 1gram
  n1_full <- twitter_lookup[twitter_lookup$less1gram == n1_search,]
  if(nrow(n1_full)<1) {n1_next <- c(0,default)} else {n1_next <- n1_full[1,7:8]}
  
  if(n2_next[1] > n3_next[1]) { showdown <- n2_next} else { showdown <- n3_next }
  if(n1_next[1] > showdown[1]) { output <- n1_next} else {output <- showdown}
  
  output
}
#
# blogs prediction 
#
blogs_predict <- function(x) {
  # load dataset
  blogs_lookup <- read.csv(file = "blogs_lookup.csv",stringsAsFactors = FALSE)
  default <- blogs_lookup[blogs_lookup$length == 1,8]
  
  # clean input
  work <- clean_input(x)
  
  #split x into n1, n2, n3, and n4 length strings
  chopped <- strsplit(work," ")
  howlong <- length(chopped[[1]])
  if(howlong < 3) { maxcount <- howlong} else { maxcount <- 3}
  
  for(i in 1:maxcount) {
    nam <- paste("n",i,"_search",sep = "")
    assign(nam,chopped[[1]][howlong+1-i])
  }
  
  #search for a 3gram
  if(maxcount > 2) {
    n3_search <- paste(n3_search,n2_search,n1_search,sep =" ")
    
    n3_full <- blogs_lookup[blogs_lookup$less1gram == n3_search,]
    if(nrow(n3_full)<1) {n3_next <- c(0,default)} else {n3_next <- n3_full[1,7:8]}
    
  } else { n3_next <- c(0,default)}
  
  #search for a 2gram
  if(maxcount > 1) {
    n2_search <- paste(n2_search,n1_search,sep =" ")
    
    n2_full <- blogs_lookup[blogs_lookup$less1gram == n2_search,]
    if(nrow(n2_full)<1) {n2_next <- c(0,default)} else {n2_next <- n2_full[1,7:8]}
    
  } else { n2_next <- c(0,default)}
  
  #search for a 1gram
  n1_full <- blogs_lookup[blogs_lookup$less1gram == n1_search,]
  if(nrow(n1_full)<1) {n1_next <- c(0,default)} else {n1_next <- n1_full[1,7:8]}
  
  if(n2_next[1] > n3_next[1]) { showdown <- n2_next} else { showdown <- n3_next }
  if(n1_next[1] > showdown[1]) { output <- n1_next} else {output <- showdown}
  
  output
}

# 
# news prediction
#
news_predict <- function(x) {
  # load dataset
  news_lookup <- read.csv(file = "news_lookup.csv",stringsAsFactors = FALSE)
  default <- news_lookup[news_lookup$length == 1,8]
  
  # clean input
  work <- clean_input(x)
  
  #split x into n1, n2, n3, and n4 length strings
  chopped <- strsplit(work," ")
  howlong <- length(chopped[[1]])
  if(howlong < 3) { maxcount <- howlong} else { maxcount <- 3}
  
  for(i in 1:maxcount) {
    nam <- paste("n",i,"_search",sep = "")
    assign(nam,chopped[[1]][howlong+1-i])
  }
  
  #search for a 3gram
  if(maxcount > 2) {
    n3_search <- paste(n3_search,n2_search,n1_search,sep =" ")
    
    n3_full <- news_lookup[news_lookup$less1gram == n3_search,]
    if(nrow(n3_full)<1) {n3_next <- c(0,default)} else {n3_next <- n3_full[1,7:8]}
    
  } else { n3_next <- c(0,default)}
  
  #search for a 2gram
  if(maxcount > 1) {
    n2_search <- paste(n2_search,n1_search,sep =" ")
    
    n2_full <- news_lookup[news_lookup$less1gram == n2_search,]
    if(nrow(n2_full)<1) {n2_next <- c(0,default)} else {n2_next <- n2_full[1,7:8]}
    
  } else { n2_next <- c(0,default)}
  
  #search for a 1gram
  n1_full <- news_lookup[news_lookup$less1gram == n1_search,]
  if(nrow(n1_full)<1) {n1_next <- c(0,default)} else {n1_next <- n1_full[1,7:8]}
  
  if(n2_next[1] > n3_next[1]) { showdown <- n2_next} else { showdown <- n3_next }
  if(n1_next[1] > showdown[1]) { output <- n1_next} else {output <- showdown}
  
  output
}
