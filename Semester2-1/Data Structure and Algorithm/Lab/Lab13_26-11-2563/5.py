### Function ###
def isCycleUntil(vertex,visited,recStack,vertexList,adjMatrix):
    visited[vertexList.index(vertex)] = True
    recStack[vertexList.index(vertex)] = True

    for i in range(len(adjMatrix[vertexList.index(vertex)])):
        if adjMatrix[vertexList.index(vertex)][i] == 1:
            if not visited[i]:
                if isCycleUntil(vertexList[i],visited,recStack,vertexList,adjMatrix) == True:
                    return True
            elif recStack[i] == True:
                return True

    recStack[vertexList.index(vertex)] = False
    return False


def cycleCheck(vertexList,adjMatrix):
    visited = [False for i in range(len(vertexList))]
    recStack = [False for i in range(len(vertexList))]
    for i in range(len(vertexList)):
        if visited[i] == False:
            if isCycleUntil(vertexList[i],visited,recStack,vertexList,adjMatrix) == True:
                return True
    return False

### Main ###
inputList = input("Enter : ")
inputList = [ item.split() for item in inputList.split(',')]

vertexSet = set()
for item in inputList:
    vertexSet.add(item[0])
    vertexSet.add(item[1])

vertexList = sorted(list(vertexSet))

adjMatrix = [[ 0 for i in range(len(vertexList))] for j in range(len(vertexList))]

for item in inputList:
    adjMatrix[vertexList.index(item[0])][vertexList.index(item[1])]  = 1

if cycleCheck(vertexList,adjMatrix) == True:
    print("Graph has a cycle")
else:
    print("Graph has no cycle")
