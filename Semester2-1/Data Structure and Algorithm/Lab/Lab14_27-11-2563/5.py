graph = {   'A':{'B':1,'C':2},
            'B':{'D':12,'A':1}, 
            'C':{'D':9,'F':3,'A':2}, 
            'D':{'C':9,'E':7,'G':1},
            'E':{'G':5,'D':7}, 
            'F':{'G':4}, 
            'G':{'D':1,'E':5,'F':4} 
            }

### Function ###
def Dijkstra(startVertex,endVertex,graph):
    pathKnown = dict()
    pathDistance = dict()
    pathVertex = dict()
    for vertex in graph:
        pathKnown[vertex] = False
        pathDistance[vertex] = float('inf')
        pathVertex[vertex] = vertex
    pathDistance[startVertex] = 0

    while True:
        minDistance = float('inf')
        v = None
        for vertex in graph:
            if minDistance > pathDistance[vertex] and pathKnown[vertex] == False:
                v = vertex 
                minDistance = pathDistance[vertex]
        pathKnown[v] = True

        if v == None:
            break
        for u in graph[v]:
            if pathDistance[v]+graph[v][u] < pathDistance[u]:
                pathDistance[u] = pathDistance[v]+graph[v][u]
                pathVertex[u] = v
    
    # print(pathKnown)
    # print(pathDistance)
    # print(pathVertex)

    shortestPath = []
    walkWay = endVertex
    while walkWay != startVertex:
        shortestPath.append(walkWay)
        walkWay = pathVertex[walkWay]
    shortestPath.append(walkWay)
    shortestPath.reverse()

    return pathDistance[endVertex],shortestPath
    
### Main ###
print(" *** Dijkstra's shortest path ***")
startVertex,endVertex = input("Enter start and target vertex : ").split()

pathDistance, shortestPath = Dijkstra(startVertex,endVertex,graph)
print("Shortest distance is {}".format(pathDistance))
print("And the path is {}".format(shortestPath))
