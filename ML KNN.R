#NEAREST NEIGHBOUR FOR BREAST CANCER PREDICTION
data<-read.csv("C:\\Users\\USER\\Documents\\NIIT\\ML Projects\\cancer.csv", stringsAsFactors=FALSE)
data
View(data)
str(data)
summary(data)
data<-data[-1]
data
table(data$diagnosis)

#Coding target feature as factor
data$diagnosis<-factor(data$diagnosis, levels=c("B","M"), labels = c("Benign","Malignant"))
data$diagnosis
table(data$diagnosis)

#Proportion of M & B
round(prop.table(table(data$diagnosis))*100, digits = 1)
summary(data[c("radius_mean", "area_mean", "smoothness_mean")])

#Normalizing data
#Create a normalise() function

normalise<-function(x){
  return((x-min(x))/(max(x)-min(x)))
}
#Test normalise
normalise(c(1,2,3,4,5))

data_n<-as.data.frame(lapply(data[2:31], normalise))
data_n
summary(data_n[c("radius_mean", "area_mean", "smoothness_mean")])

#Creating training and test datasets 
data_train<-data_n[1:469, ]
data_test<-data_n[470:569, ]

#Creating labels for training and test datasets
data_train_labels<-data[1:469, 1]
data_test_labels<-data[470:569, 1]

data_train_labels
data_test_labels

#Training a model on the data
#Training in KNN involes storing the input dat in a structured format. 
#To classify our test instances, we will use a KNN implementation from the class package
install.packages("class")
library(class)


data_test_pred<-knn(train=data_train, test=data_test, cl=data_train_labels, k=21)
data_test_pred

#Evaluating model performance

install.packages("gmodels")
library(gmodels)

CrossTable(x=data_test_labels, y=data_test_pred, prop.chisq = FALSE)

#Improving model performance
#Transformation - z-score standardization
data_z <- as.data.frame(scale(data[-1]))

#Summary statistics toi confirm transformation
summary(data_z$area_mean)

#Creating training and test datasets 
data_train<-data_z[1:469, ]
data_test<-data_z[470:569, ]

#Creating labels for training and test datasets
data_train_labels<-data[1:469, 1]
data_test_labels<-data[470:569, 1]

data_train_labels
data_test_labels

#Classification
install.packages("class")
library(class)

data_test_pred<-knn(train=data_train, test=data_test, cl=data_train_labels, k=21)
data_test_pred

#Evaluating model performance
installed.packages("gmodels")
library(gmodels)

CrossTable(x=data_test_labels, y=data_test_pred, prop.chisq = FALSE)


#Adjusting K values
data_test_pred<-knn(train=data_train, test=data_test, cl=data_train_labels, k=5)
data_test_pred

CrossTable(x=data_test_labels, y=data_test_pred, prop.chisq = FALSE)


data_test_pred<-knn(train=data_train, test=data_test, cl=data_train_labels, k=27)
data_test_pred

CrossTable(x=data_test_labels, y=data_test_pred, prop.chisq = FALSE)
