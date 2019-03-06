
rm(list = ls()) # wipe the entire environment

getwd() # working directory

# chage working derectory
# setwd("..")

# Load animals.csv

animals = read.csv("/Users/weiyou/Downloads/R-Fundamentals-uv201902/data/animals.csv")
# animals = read.csv

head(animals)

str(animals)

# subset animals.csv into three groups:
# 1. cats (that contains only cats)
cats = animals[animals$Type == "Cat" , ] #bracket[row , columns] in R row alwags goes first

# 2. dogs (that contains only dogs)
dogs = animals[animals$Type == "Dog" , ]

# 3. pigs (that contains only pigs)
pigs = animals[animals$Type == "Pig" , ]

# make one histogram, one boxplot, and one scatterplot for some variables(s).
# hint: thant might you need to import first?


# histrogram = visualize the distribution of ONE variables
hist(animals$Weight, 
     breaks = nrow(animals)-1,
     col = "gold",
     main = "Title",
     xlab = "Weight (kg)",
     ylab = "FREQ",
     las = 1) #xlabel in horzotal
# ?hist
# 《the grammer of graphics (statistics and computing)》《the visulazation Disply。。？》
library(ggplot2) #import the package, author: Hadley (UCB)
?ggplot

ggplot(animals, aes(x = Weight))  + 
  geom_histogram()

# class(animals$Height)
# class(animals$Weight)

# boxplot
ggplot(animals, aes(x = Type, y = Weight, fill = Type)) +
  geom_boxplot() +
  ggtitle("Animal weight (kg)") +
  theme(plot.title = element_text(hjust = 0.5))  #center title

summary(cats$Weight)
summary(dogs$Weight)
summary(pigs$Weight)

# scatterplots : two continues factors
ggplot(animals, aes(x = Height, y = Weight, 
                    color = Type, shape = Type)) +
  geom_point(size = 3, alpha = 0.5) + 
  ggtitle("Weight - Height") +
  theme(plot.title = element_text(hjust = 0.5))  #center title
  

# basic statistical testing in R
?shapiro.test()
shapiro.test(animals$Height)
shapiro.test(animals$Weight)

# t-test - compare means of one or two groups
# p-value

# compare means in Height between cats and dogs

# 1. ask a research question: 
# Is there a significant differnence between heights of cats and dogs?

# 2. READ! read 1-2 article everyday! just keep your mind fresh!
# annotate everything!

# 3. Formulate hypotheses!
# (Part 3. Statistical testing)
# Hypothesis testing
# the null (Ho) and the alternative (Ha)
# 4. Ho: no height diff between cat and dog heights
#    Ha: there is a difference in height between cats and dogs
?t.test
?chisq.test # for count data - not discussed in this workshop

t.test(x = cats$Height, y = dogs$Height)

?wilcox.test


# one way anova (analysis of variance) - to compare mean variance of two of more groups
# F-value
height_aov = aov(animals$Height ~ animals$Type) 
summary(height_aov)

# what about "family-wise error"? 
# multiple comparisons

# Tukey test for Honeset Significant Differences
TukeyHSD(height_aov)
# benjamini-hockbery, Bonferroni


# Pearson conrrelation
?cor.test # pearson, spearman, kendall
cor.test(animals$Height, animals$Weight)
# cor.test(x = animals$Height, y = animals$Weight)

# simple OLS regression ?
# Y ~ X
# Y = dependent, target, outcome, response
# X = independent, input, perdictor, feature, covariate
# "refress Y onto X" = we want to use X to predict Y!
?lm # linear models
animals_lm = lm(animals$Weight ~ animals$Height)
summary(animals_lm)
# find help here:
# fitting & interpreting linear models in R - The Yhat Blog
