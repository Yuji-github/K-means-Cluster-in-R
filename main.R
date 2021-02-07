# K-means Clusters
library(caTools)

#import data 
dataset = read.csv('Mall_Customers.csv')

# independent variables (Only annual income and Total scores)
independent = dataset[4:5]

# elbow method for optimal clusters
set.seed(6)
wcss = vector() # create vector/array to append wcss values
for (i in 1:10) wcss[i] = sum(kmeans(independent, i)$withinss)
plot(1:10, wcss, type = 'b', main=paste('Cluster of Clients'), xlab = 'Num of Clusters', ylab = 'WCSS')
# withinss Vector of within-cluster sum of squares, one component per cluster.

# fit/train the models
set.seed(29)
Kmeans = kmeans(independent, 5, iter.max = 300, nstart = 10)
# kmeans(datset, num of clusters, max of iter, inital start)

# visualizing the clusters
library(cluster)
clusplot(independent, Kmeans$cluster, 
         lines = 0, 
         shade = TRUE, color = TRUE, 
         labels = 2, plotchar = FALSE, 
         span = TRUE, main = paste('Num of Clusters'), 
         xlab = 'Annual Income', 
         ylab = 'Spending Score')