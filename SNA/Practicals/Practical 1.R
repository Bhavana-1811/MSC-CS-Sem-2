library(igraph)
u_graph <- graph.formula(A - B, A - C, A - D, B - C, B - F, C - D, C - E, C - F, D - E, E - F, F - G, G - H)
d_graph <- graph.formula(A ++ B, A ++ D, A -+ C, B -+ C, B -+ E, B -+ F, C -+ D, C -+ F, D -+ E)

#Edges Count
ecount(u_graph)
ecount(d_graph)

#Vertices Count
vcount(u_graph)
vcount(d_graph)

#Display Edges
E(u_graph)
E(d_graph)

#Display Vertices
V(u_graph)
V(d_graph)

#Displaying Degree of Vertices
degree(u_graph)
degree(u_graph, mode = "in")
degree(u_graph, mode = "out")

degree(d_graph)
degree(d_graph, mode = "in")
degree(d_graph, mode = "out")

V(u_graph)$name[degree(u_graph) == min(degree(u_graph))]  # minimum degree Vertice
V(d_graph)$name[degree(d_graph, mode = "in") == min(degree(d_graph, mode = "in"))]
V(d_graph)$name[degree(d_graph, mode = "out") == min(degree(d_graph, mode = "out"))]

#display adjaceny matrix
get.adjacency(u_graph)
get.adjacency(d_graph)

#returns list for adjacent edges or vertices
get.adjlist(u_graph)
get.adjlist(d_graph)

