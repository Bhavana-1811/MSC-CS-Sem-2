require("igraph")

edges <- read.csv("E:/edges.csv")
nodes <- read.csv("E:/nodes.csv")

head(edges)
head(nodes)

dir_graph <- graph.data.frame(d = edges, vertices = nodes, directed = T)
get.adjacency(dir_graph)

plot(dir_graph)