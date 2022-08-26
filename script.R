if ( !("dplyr" %in% rownames(installed.packages()))) install.packages("dplyr", repos = "http://cran.us.r-project.org")
if ( !("stringi" %in% rownames(installed.packages()))) install.packages("stringi", repos = "http://cran.us.r-project.org")
if ( !("stringr" %in% rownames(installed.packages()))) install.packages("stringr", repos = "http://cran.us.r-project.org")
library(dplyr)
library(stringi)
library(stringr)

clean_text <- function(text){
  text <- text %>% tolower() %>% stri_trans_general(id = "Latin-ASCII")
  text <- gsub('[[:punct:] ]+',' ',text)
  text <- str_replace_all(text, "[^[:alnum:]]", " ")
  text <- (gsub(" ", "", text, fixed = TRUE) %>% strsplit(""))[[1]]
  return('text'=text)
}

build_translation_matrix <- function(){
  # the encoding rule is creating on the fly, as needed 
  alphabet <- c('a', 'b', 'c', 'd','e','f','g','h','i','l','m','n','o','p','q','r','s','t','u','v','z')
  code <- matrix(NA,ncol=6, nrow=21, byrow=F) %>% data.frame
  code[,1] <- 0
  code[,2] <- alphabet
  # colnames(code) <- c('how_many_are_full', 'letter', 'code1', 'code2', 'code3')
  return(code)
}

code_already_seen_for_this_letter <- function(line, pair){
  how_many_are_full <- line[1]
  if(how_many_are_full==0){
    line[3]= pair
    line[1] = 1
  }else if (how_many_are_full==1){
    if(line[3] != pair) {
      line[4]= pair
      line[1] = 2
    }
  }else if(how_many_are_full==2){
    if(line[3] != pair & line[4] != pair){
      line[5] = pair
      line[1] = 3
    } 
  }else if(how_many_are_full==3){
    if (line[3] != pair & line[4] != pair & line[5] != pair){
      line[6] = pair
      line[1] = 4
    }
  }else if(how_many_are_full==4){
    if (line[3] != pair & line[4] != pair & line[5] != pair) return(-1)
  }
  return(line)
}

find_in_one_subseq <- function(full_seq, from, to, poetry){
  code <- build_translation_matrix()
  seq1 <- full_seq[from:to]
  for(i in 1:length(seq1)){
    idx <- which(code[,2]==poetry[i])
    temp <- code_already_seen_for_this_letter(code[idx,], seq1[i])
    if(length(temp)==1){
      #cat("LOST after", i)
      return(list('done'=FALSE, lost_after=i, 'code'=code))
    } 
    code[idx,] <- temp
  }
  return(list('done' = TRUE, lost_after=-1, 'code'=code))
}

sub_seq <- function(seq, how_many_digits_to_try){
  if((how_many_digits_to_try/2)>length(seq)){
    print("ERROR: how_many_digits_to_try is greater than the total number of digits")
  }else return(seq[1:how_many_digits_to_try])
}

find_over_all_sequence <- function(seq, poetry,how_many_digits_to_try){
  n_char <- length(poetry)
  lost_at <- 0
  seq <- sub_seq(seq, how_many_digits_to_try/2)
  for(i in 1:(length(seq)-n_char)){
    if(i%%1000 == 0){
      done <- i/(length(seq)-n_char)*100
      best <- max(lost_at)/n_char *100
      cat('\n done: ',round(done,1), ' %.    The best I founded so far was ',  round(best, 1), ' % of the poetry')
    }  
    res <- find_in_one_subseq(seq, i, i+n_char-1, poetry)
    if(i==1) best_encoding <- res$code
    if (!res$done) {
      if(res$lost_after>max(lost_at)) best_encoding <- res$code
      lost_at <- c(lost_at, res$lost_after)
    }else{
      cat('Your poetry has been found in the ', i, 'nd sub-sequence of decimals!')
      return(list(res, 'founded_after'=i, best_encoding))
    } 

  }
  return(list('best_encoding'=best_encoding, 'lost_at'=lost_at))
}

main <- function(how_many_digits_to_try){
  print("it's gonna take a while....")
  digits <- readChar('pi_digits_1_milion.txt', file.info('pi_digits_1_milion.txt')$size) %>% str_sub(4,-2)
  seq <- sapply(seq(from=1, to=nchar(digits), by=2), function(i) substr(digits, i, i+1)) %>%
    as.numeric
  poetry <- readChar('poetry.txt', file.info('poetry.txt')$size) %>%
    clean_text
  res <- find_over_all_sequence(seq,poetry,how_many_digits_to_try)
  cat('\n\n The longest part of your poetry that is encoded in the first ',  
  how_many_digits_to_try, ' decimal digits of pi is: \n "', 
      paste(poetry[1:max(res[[2]])]), sep="", '"\n') 
  return(res)
}

args = commandArgs(trailingOnly=TRUE)
res <- main(as.numeric(args[1]))


