### Class ###
class GenshinBST:
    def __init__(self):
        self.storage = []

    def insert(self,value):
        self.storage.append(value)
    
    def getPowerOfTeam(self,root_index):
        index = root_index
        power = 0
        
        queue = []
        queue.append(index)

        while len(queue) != 0:
            power += self.storage[index]

            if (2*index)+1 < len(self.storage):
                queue.append((2*index)+1)

            if (2*index)+2 < len(self.storage):
                queue.append((2*index)+2)
            
            queue.pop(0)
            if len(queue) != 0:
                index = queue[0]

        return power
    
    def comparePowerOfTeam(self,root_index_A,root_index_B):
        if self.getPowerOfTeam(root_index_A) > self.getPowerOfTeam(root_index_B):
            print("{}>{}".format(root_index_A,root_index_B))
        elif self.getPowerOfTeam(root_index_A) < self.getPowerOfTeam(root_index_B):
            print("{}<{}".format(root_index_A,root_index_B))
        else:
            print("{}={}".format(root_index_A,root_index_B))

### Main ###
insertList, commandList = input("Enter Input : ").split('/')
insertList = list(map(int, insertList.split()))
commandList = [list(map(int,item.split())) for item in commandList.split(',')]

tree = GenshinBST()
for value in insertList:
    tree.insert(value)

print(tree.getPowerOfTeam(0))
for command in commandList:
    root_index_A = command[0]
    root_index_B = command[1]
    tree.comparePowerOfTeam(root_index_A,root_index_B)
