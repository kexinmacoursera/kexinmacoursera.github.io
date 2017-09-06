library(dplyr)
?arrange  #sort in order aesc by default
mtcars
arrange(mtcars,cyl,am)   #sort mtcars data in order by cyl and then sort by am
#User %>% operator for example 
mtcars %>% arrange(cyl,am) 
mtcars %>% select(mpg,cyl) # mtcar as input and then "select.."
#select first and then sort
mtcars %>% select(mpg,cyl) %>% arrange(mpg)
