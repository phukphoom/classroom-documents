# ### Function ###
def Dijkstra(startVertex,endVertex,vertexList,adjMatrix):
    if startVertex not in vertexList or endVertex not in vertexList:
        print("Not have path : {} to {}".format(startVertex,endVertex))
        return 

    pathDistance = [float('inf') for i in range(len(vertexList))]
    pathDistance[vertexList.index(startVertex)] = 0
    pathKnown = [False for i in range(len(vertexList))]
    pathVertex = vertexList.copy()

    while True:
        minIndex = None
        minDistance = float('inf')
        for i in range(len(pathVertex)):
            if pathDistance[i] < minDistance and pathKnown[i] == False:
                minDistance = pathDistance[i]
                minIndex = i

        if minIndex == None:
            break
        
        v = vertexList[minIndex]
        pathKnown[vertexList.index(v)] = True
        
        for i in range(len(adjMatrix[vertexList.index(v)])):
            if adjMatrix[vertexList.index(v)][i] != 0:
                if pathDistance[vertexList.index(v)] + adjMatrix[vertexList.index(v)][i] < pathDistance[i]:
                    pathDistance[i] = adjMatrix[vertexList.index(v)][i] + pathDistance[vertexList.index(v)]
                    pathVertex[i] = v
        
        # print(pathVertex)
        # print(pathDistance)
        # print(pathKnown)
        
    if pathDistance[vertexList.index(endVertex)] == float('inf'):
        print("Not have path : {} to {}".format(startVertex,endVertex))
    else:
        shortestPath = []
        point = endVertex

        while point != startVertex:
            shortestPath.append(point)
            point = pathVertex[vertexList.index(point)]

        shortestPath.append(point)
        shortestPath.reverse()

        print("{} to {} : {}".format(startVertex,endVertex,"->".join(shortestPath)))      

### Main ###
inputList,commandList = input("Enter : ").split('/')
inputList = [item.split() for item in inputList.split(',')]
commandList = [item.split() for item in commandList.split(',')]


vertexSet = set()
for item in inputList:
    vertexSet.add(item[0])
    vertexSet.add(item[2])

vertexList = sorted(list(vertexSet))

adjMatrix = [[ 0 for i in range(len(vertexList))] for j in range(len(vertexList))]

for item in inputList:
    adjMatrix[vertexList.index(item[0])][vertexList.index(item[2])]  = int(item[1])

for command in commandList:
  Dijkstra(command[0],command[1],vertexList,adjMatrix)

