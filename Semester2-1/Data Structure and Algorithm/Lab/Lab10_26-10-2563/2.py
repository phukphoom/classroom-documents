### Class ###
class Node:
    def __init__(self, value):
        self.value = value
        self.left = None
        self.right = None


class BinarySearchTree:
    def __init__(self, root=None):
        if root is None:
            self.root = None
        else:
            self.root = root

    def getMinNode(self, root):
        current = root
        while current.left is not None:
            current = current.left
        return current

    def getMaxNode(self, root):
        current = root
        while current.right is not None:
            current = current.right
        return current

    def getClosetValue(self,value):
        current = self.root

        minDistance = 9999999
        closestValue = 0

        while current is not None:
            # print(current.value,end=' -> ')
            if abs(value-current.value) < minDistance:
                minDistance = abs(value-current.value)
                closestValue = current.value

            if value > current.value:
                if current.right is None:
                    return closestValue
                current = current.right
            elif value < current.value:
                if current.left is None:
                    return closestValue
                current = current.left

        return closestValue
    
    def insert(self, value):
        newNode = Node(value)

        if self.root is None:
            self.root = newNode
        else:
            current = self.root
            while current is not None:
                if value < current.value:
                    if current.left is not None:
                        current = current.left
                    else:
                        current.left = newNode
                        return self.root
                else:
                    if current.right is not None:
                        current = current.right
                    else:
                        current.right = newNode
                        return self.root

    def printTree(self, node, level=0):
        if node is not None:
            self.printTree(node.right, level + 1)
            print('     ' * level, node.value)
            self.printTree(node.left, level + 1)


### Main ###
insertList, closestValue = input("Enter Input : ").split('/')
insertList = list(map(int, insertList.split()))
closestValue = int(closestValue)

tree = BinarySearchTree()
for item in insertList:
    tree.insert(item)
    tree.printTree(tree.root)
    print('--------------------------------------------------')
print('Closest value of {} : {}'.format(
    closestValue, tree.getClosetValue(closestValue)))
