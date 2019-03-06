?read.csv

animals = read.csv("/Users/weiyou/Downloads/R-Fundamentals-master/data/animals.csv", 
                    header = TRUE, 
                    stringsAsFactors = F,#T,
                    na.strings = "") #c("Dog", "10", " ", "PIZZA", "?"))#" ")
getwd()

animals

str(animals)

# Challenge 1
library(VIM)

# import the dataset
sv = read.csv("data/Sleep_VIM.csv")
sv
#View(sv)

# Subsetting in  one dimension with $
sv$NonD
hist(sv$NonD, col='pink')

log10(sv$NonD)
hist(log10(sv$NonD), col="green")

# bracket notation = 2D subsetting
# [rows , cols]

# subset with variabls names
animals_vernames = animals[ , c("Height", "Weight")] #[rows, cols]
animals_vernames

# subset with positive integers
str(animals)
colnames(animals)
animals_posint = animals[ , 4:3]
animals_vernames = animals[ , c(4,3)]
animals_posint

# subset with negative integers
animals_negint = animals[ , -c(1,2,5)] #delelate col[1,2,5]
animals_negint

# reorder columns 
animals_negint = animals_negint[ , c(2,1)] #重新排列
animals_negint

#Challenge!
data() # view R's pre-baked datasets
data(iris) # load the "iris" dataset
str(iris)
head(iris, n=3)

# subset iris in three different ways

# 1.
iris_species = iris$Species
#rm(irir_species)
iris_petal = iris[ , c(3,4)]
iris_petal = iris[ , 3:4]
#what if I just want rows 1 thru 6?
iris_petal = iris[1:6 , c(3,4)]
iris_petal = iris[c(1:6) , 3:4]

# what if I just want rows 1 thru 6 and 132?
iris_petal = iris[c(1:6, 132) , 3:4]

# what if I just want rows 1 thru 6 and 132 and 148?





head(iris_petal)
#nrow(iris) ncols(iris)
iris_evens = iris[seq(from = 2, to = nrow(iris), by = 2) , 1:2]
iris_evens

?sample
#set.seed(5)
iris_random = iris[sample(rownames(iris), 3, replace=F), 1:2]
iris_random
#rownames(iris)

# 2. 
iris_sepal = iris[ , -c(3,4,5)]
# what if I just want rows 1 thru 6 and 132 and 148 using -c()?
iris_sub2 = iris[-c(7:131, 133:147, 149:nrow(iris)) , -c(3:5)]
iris_sub2

iris_sepal = iris_sepal[ , c(2,1)]
iris_sepal = iris_petal[ , c("Sepal.Width", "Sepal.Length")]
head(iris_sepal)

# 3. 
iris_sub3 = iris[ , c("Sepal.Width", "Sepal.Length")]
iris_sub3 = iris_sub3[ , c("Sepal.Length", "Sepal.Width")]
head(iris_sub3)

# subsetting with logical tests
summary(iris)

#subset all Sepal.Lenth that are greater than 5.843
iris_greater_than = iris[iris$Sepal.Length> 5.843 , ] #in rows position: give me all the rows meet the requirement, not the colums
iris_greater_than

#
iris_setosa = iris[iris$Species == "setosa" , ]
iris_setosa

iris_setosa = iris[iris["Species"] == "setosa" , ]

# logical "and" = &
# ALL CONDITIONS MUST BE ASTISFIED to be included in the subset
# subset all rows where Sepal.Length ? 5.8 AND species == bersicolor
head(iris)
iris_and = iris[iris$Sepal.Length > 5.8 & iris$Species == "versicolor" , ]
iris_and


# logical "or" = |
# JUST ONES CONDITION of many needs to be satisfied to be included
iris_or = iris[iris$Sepal.Length > 5.8 | iris$Species == 'versicolor' , ]
iris_or

# challenge 5
# file:///Users/weiyou/Downloads/R-Fundamentals-master/R_Fundamentals_Part_2_Subsetting_and_reshaping.html#11_challenge_5

# 1. Using the “animals” data frame, 
head(animals)
#create a subsetted data frame called cats_dogs that contains only cats and dogs. 
#(hint: does “and” actually mean “and” here?)
cats_dogs = animals[animals$Type == "Dog" | animals$Type =="Cat" , ]
cats_dogs
str(cats_dogs)
?drop

# 2. Create a subsetted data frame that only contains healthy pigs! 
#(hint: what is the meaning of “and” here in contrast to question #1?)
healty_pigs = animals[animals$Type == "Pig" & animals$Healthy == TRUE, ]
healty_pigs

# 3. load the mtcars dataset. 
# How might you find out what it is and how do you load it?
data()
?mtcars

data(mtcars)

# 4. subset mtcars in five different ways.
str(mtcars)
head(mtcars)

mtcars_4gear = mtcars[mtcars$gear == 4 , ]
mtcars_4gear

ncol(mtcars)
matcars_sub1 = mtcars[ , 5:ncol(mtcars)]
matcars_sub1

matcars_HondaCivic = mtcars[rownames(mtcars)=="Honda Civic" , ]

mercedes = mtcars[grep("^Merc", rownames(mtcars)) , ]
mercedes

grep("^Merc", rownames(mtcars))

toyota = mtcars[grep("^Toy", rownames(mtcars)) , ]
toyota

H = mtcars[grep("^H", rownames(mtcars)) , ]
H

