my_name = 'Joe'
x = 5
library(knitr)
?summary
numeric_object <- 4
ls() # show us what is in our global environment

welcome_object <- "Welcome to the D-Lab"
ls()

(welcome_object <- "Welcome to Barrows Hall" )

class(numeric_object)

class(welcome_object)

rm(numeric_object)

rm(list = ls()) # wipe the entire environment
ls()

??psych # lead you to coding walkthroughs called “vignettes”

?grep

char2 <- paste("Hey", "momma", "I'm", "a", "string.")
char3 = paste0("Hi", "momma", "I'm", 'a', "string")

(vsc1 = c(4,3,2))
class(vsc1)

vec2 = c(4L, 3L, 12L)
class(vec2)

?c()

dog_name = c("Max", "Lulu", "Wiwi")
class(dog_name)

char <- "This/is/slash/separated/text"
split1 <- strsplit(char, split = "/")
concatate1 <- paste(split1)
split1
concatate1

char2
substr(char2, start=1, stop=4)
substr(char2, 1, 4) <- "Yes"
char2

vector1 = c(3, 12, 18)
vector1
vector1[2]
vector1[3]
vector1[4]
length(vector1)

#generating number sequeces
?seq
seq(from = 1, to = 10, by = 1)
seq(from = 1, to = 10, by = 2)
1:10
55:61


rm(list = ls())

# 20 random numbers from normal distribution
?rnorm
set.seed(1)
normal = rnorm(20, mean=0, sd=1)
normal

?runif
uniform = runif(20, min = 0, max = 1)
uniform

?sample
int_samp = sample(x = 5:100, size=20, replace = F)
int_samp

# sample 20 draws from the vectors
char_samp = sample(x=c("Cat", "Dog", "Pig"), size=20, replace=T)
char_samp

logical_samp = sample(x = c(TRUE, FALSE), size=20, replace=T)
logical_samp
class(logical_samp)

# data Frame = an ordered list of EQUAL LENGTH VECTORS
?data.frame
animals = data.frame(normal, uniform, int_samp, char_samp, logical_samp)
animals

matrix(1:10, nrow=5, ncol=2) # all the data should be same type
my_list = list("Evan", c(1, 5, 9), TRUE)
my_list

?str #structure in R
str(animals)
class(animals)
animals$normal
hist(animals$normal, col="gold")#" peru")
colors()  

dim(animals) #dimensional return rows and columns
head(animals) #first 
head(animals, n = 3)
tail(animals, n = 1) #default is 6
colnames(animals)

# rename columns!
colnames(animals) = c("Pizza", "Ice Cream", "Salad", "Chicken", "Soda")#, "Wine")
colnames(animals) = c("Progress", "Height", "Weight", "Type", "Healthy")
head(animals)
colnames(animals)[3] = c("WEIGHT")
head(animals)

# make a copy
animals2 = animals

# export this
write.csv(animals, file = "my_first_dataframe.csv", row.names = F) #save

getwd() # save here in current working path = default home path


