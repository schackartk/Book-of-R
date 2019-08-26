# Cumbersome plot setup
plot(iris[,4],iris[,3],type="n",xlab="Petal Width (cm)",ylab="Petal Length (cm)")
points(iris[iris$Species=="setosa",4],iris[iris$Species=="setosa",3],pch=19,col="black")
points(iris[iris$Species=="virginica",4],iris[iris$Species=="virginica",3],pch=19,col="gray")
points(iris[iris$Species=="versicolor",4],iris[iris$Species=="versicolor",3],pch=1,col="black")
legend("topleft",legend=c("setosa","virginica","versicolor"),col=c("black","gray","black"),pch=c(19,19,1))

# Cleaner plot setup
iris_pch <- rep(19,nrow(iris))
iris_pch[iris$Species=="versicolor"] <- 1
iris_col <- rep("black",nrow(iris))
iris_col[iris$Species=="virginica"] <- "gray"

plot(iris[,4],iris[,3],col=iris_col,pch=iris_pch,xlab="Petal Width (cm)",ylab="Petal Length (cm)")
pairs(iris[,1:4],pch=iris_pch,col=iris_col,cex=0.75)
