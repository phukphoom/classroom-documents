### Main ###
inputList = input("Enter : ")
inputList = [ item.split() for item in inputList.split(',')]

vertexSet = set()
for item in inputList:
    vertexSet.add(item[0])
    vertexSet.add(item[1])

vertexList = sorted(list(vertexSet))

adjMatrix = [[ '0' for i in range(len(vertexList))] for j in range(len(vertexList))]

for item in inputList:
    adjMatrix[vertexList.index(item[0])][vertexList.index(item[1])]  = '1'

print("    ",end='')
for vertex in vertexList:
    print("{} ".format(vertex),end=' ')
print()

for i in range(len(vertexList)):
    print("{} : {}".format(vertexList[i],", ".join(adjMatrix[i])))
