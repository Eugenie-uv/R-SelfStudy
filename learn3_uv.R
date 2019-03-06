getwd()

animals = read.csv("/Users/weiyou/Downloads/R-Fundamentals-master/data/animals.csv")


?install.packagesinstall.packages("data.table")
library(data.table)
?fread #Fast and friendly file finagler

my_data = fread("http://people.sc.fsu.edu/~jburkardt/data/csv/biostats.csv")
my_data

install.packages("curl")
library(curl)
?curl
class(curl) # function

library(textreader)

install.packages("psych", "ggplot2")
library(psych)
?psych
library(ggplot2)
?ggplot2

ggplot = lm(animals$Weight ~ animals$Height)

ggplot2 :: ggplot(animals, aes(Height, Weight)) + geom_point()

# import the sleep_VIM dataset in a variablse called VIM
VIM = read.csv("/Users/weiyou/Downloads/R-Fundamentals-master/data/sleep_VIM.csv",
               header=TRUE, stringsAsFactors = F, na.strings = c("PIZZA", "999", "?"))
mean(VIM$NonD)
View(VIM)

head(animals)
str(animals)
animals$Type = factor(animals$Type,
                     levels = c("Dog", "Pig", "Cat"),
                     ordered = T)
animals$Type
head(animals)


?is.na #NA
head(is.na(VIM))
head(VIM)

VIM[is.na(VIM)] = "PIZZA"

sum(is.na(VIM))

sum(is.na(VIM)) / (nrow(VIM) * ncol(VIM))

# VIM[VIM == "PIZZA"] = NA

# str(VIM)
# Summarizing data
summary(animals)
table(animals$Type)
table(animals$Type, animals$Healthy)

library(psych)
?describe
describe(animals[ , -c(1:2)])

?describeBy
sum_stats = describeBy(animals[ , -c(1:2)], group = animals$Type)
dim(sum_stats)
sum_stats
sum_stats[1]
sum_stats$Dog
sum_stats$Dog[1, "se"]
sum_stats$Dog["se"][1]
sum_stats$Dog[ , "median"][1]

to_save = sum_stats$Dog[ , c("mean", "sd", "kurtosis", "skew")]
to_save

write.csv(to_save, file = "/Users/weiyou/Downloads/R-Fundamentals-master/dog_stas.csv")



# Visualizing data
# Histogram - show distributio of one continuous wariabld
hist(VIM$BodyWgt)
hist(animals$Weight, 
     # define number fo breaks
     breaks = 7,
     
     # add title here
     main = "Animal weight (kg)",
     
     xlab = "Weight (kg)", # change x-axis label
     ylab = "Frequency!",  # change y_axis label
     las = 1, # label axis style
     col = "gold")

hist(rnorm(10, mean = 0, sd = 1))
hist(rnorm(100, mean = 0, sd = 1))
hist(rnorm(1000, mean=0, sd  = 1))

# the ggplot2 way!
library(ggplot2)
data(iris)
str(iris)
# scatter plot
ggplot(data = iris, aes(x = Petal.Length, y = Petal.Width,
                 color = Species,
                 shape = Species)) +
  geom_point(size = 3) +
  ggtitle("Title goes here") +
  scale_shape_manual(values=c( 16, 17, 18))+
  scale_color_manual(values=c('turquoise','#E69F00', '#56B4E9')) #goldenrod salmon

ggplot(iris, aes(x = Petal.Length, y = Petal.Width,
                 color=Petal.Width)) +
  geom_point()


# Challenge!
# LOad the mtcars dataset
# create a gg scatterplot of two numberic variables
# export it as a hi-res.tiff (hint: export to .pdf first then convert to .tiff)
?mtcars
data()
rm(mtcars)

data(mtcars)
str(mtcars)
head(mtcars, n=3)

ggplot(mtcars, aes(x = mpg, y = disp, color = wt)) +
  geom_point()

ggplot(mtcars, aes(x = as.factor(cyl), y = mpg, color = cyl)) +
  geom_point() +
  scale_color_gradient(low = "red", high = "green")

# as.factor(cyl)) 
ggplot(mtcars, aes(x = mpg, y = hp, color = cyl)) +
  geom_point()

ggplot(mtcars, aes(x = mpg, y = hp, color = as.factor(cyl))) +
  geom_point(size = 3, alpha = 0.5) +
  ggtitle((" MPG by HP")) + 
  labs(color = "Cylinders in engine") +
  xlab("Miles per gallon (US)") + 
  ylab("Horsepower (HP)") +
  theme_bw() + # theme_bw change backgroun color into white; bd
  theme(plot.title = element_text(hjust = 0.5)) +  #center title
  theme(legend.position = 'top') 
  