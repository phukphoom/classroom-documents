### Function ###
def graphBFS(startVertex,vertexList,adjMatrix):
    visited = [False for i in range(len(vertexList))]

    queue = []
    queue.append(startVertex)
    visited[vertexList.index(startVertex)] = True

    while len(queue) != 0 or False in visited:
        if len(queue) == 0 and False in visited:
            queue.append(vertexList[visited.index(False)])
            visited[visited.index(False)] = True

        for i in range(len(adjMatrix[vertexList.index(queue[0])])):
            if adjMatrix[vertexList.index(queue[0])][i] == 1 and not visited[i]:
                queue.append(vertexList[i])
                visited[vertexList.index(vertexList[i])] = True
        print(queue[0],end=' ')
        queue.pop(0)

def graphDFS(startVertex,vertexList,adjMatrix):
    visited = [False for i in range(len(adjMatrix))]
    
    stack = []
    stack.append(startVertex)
 
    while len(stack) != 0 or False in visited:
        if len(stack) == 0 and False in visited:
            stack.append(vertexList[visited.index(False)])
    
        temp = stack.pop()
        if not visited[vertexList.index(temp)]:
            print(temp,end=' ')
            visited[vertexList.index(temp)] = True

        for i in range(len(adjMatrix[vertexList.index(temp)])-1,0,-1):
            if adjMatrix[vertexList.index(temp)][i] == 1 and not visited[i]:
                stack.append(vertexList[i])
     
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
    adjMatrix[vertexList.index(item[1])][vertexList.index(item[0])]  = 1

print("Depth First Traversals : ",end='')
graphDFS(vertexList[0],vertexList,adjMatrix)
print()
print("Bredth First Traversals : ",end='')
graphBFS(vertexList[0],vertexList,adjMatrix)
