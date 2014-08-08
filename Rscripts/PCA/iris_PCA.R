
data(iris)
#-----------------------------
# PCA the iris data
irispca<-princomp(iris[-5])

summary(irispca)
str(irispca)

mean <- irispca$center
scale <- irispca$scale
loadings <- irispca$loadings
iris_scale <- scale(iris[-5] , center = mean , scale = scale)

#-----------------------------
# iris data represented in the new coordinates (PCA components coordinates)
iris_newCoord <- iris_scale%*%loadings

#-----------------------------
# build a model using the important variables/components in the new coordinates
iris_all <- cbind(iris,iris_newCoord)

library(nnet)
fit <- multinom(Species ~ ., data= iris)
fit_class <- multinom(Species ~ Comp.1 + Comp.2, data= iris_all)

iris$prediction <- predict(fit,data=iris)
iris$prediction_pca <- predict(fit_class,data=iris_all)

iris[,5:7]
