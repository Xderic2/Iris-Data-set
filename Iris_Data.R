#A correlation then visualization on the Iris data set in R
IrisList <- read.csv('https://raw.githubusercontent.com/
uiuc-cse/data-fa14/gh-pages/data/iris.csv')
IrisList <- read.csv(url, header=FALSE)
#Inserting column names as headers
colnames(IrisList) <- c('Sepal_length','sepal_width','petal_length',
                        'petal_width','species')
print(IrisList)
#to get a general overview of the data set
summary(IrisList)

library(psych)
#to determine the correlation between each column (including the species)
pairs.panels(IrisList[1:5])

#To have a better visualization of correlation that can be interpreted easily, not including species
library(corrplot)
x <- cor(IrisList[1:4])
corrplot(x, type = "upper", order='hclust')
#I now want a nice visual piecing two main things together which were highly correlated. Petal Length and Petal Width with 
#species as a third variable
library(ggplot2)
PetalLength_PetalWidth <- ggplot(data = IrisList,
  aes(x=sepal_width, y=petal_length))
PetalLength_PetalWidth + geom_point(aes(color=species))

