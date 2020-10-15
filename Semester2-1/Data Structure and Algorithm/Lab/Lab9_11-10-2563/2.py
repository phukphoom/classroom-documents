### Class ###
class Node:
    def __init__(self, data):
        self.data = data
        self.left = None
        self.right = None

    def __str__(self):
        return str(self.data)


class BinarySearchTree:
    def __init__(self):
        self.root = None

    def insert(self, data):
        newNode = Node(data)

        if self.root is None:
            self.root = newNode
        else:
            current = self.root
            while current is not None:
                if data < current.data:
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

    def getMin(self):
        current = self.root
        while current is not None:
            if current.left is not None:
                current = current.left
            else:
                return current.data

    def getMax(self):
        current = self.root
        while current is not None:
            if current.right is not None:
                current = current.right
            else:
                return current.data

    def printTree(self, node, level=0):
        if node != None:
            self.printTree(node.right, level + 1)
            print('     ' * level, node)
            self.printTree(node.left, level + 1)


### Main ###
inputList = [int(item) for item in input('Enter Input : ').split()]
tree = BinarySearchTree()
for item in inputList:
    root = tree.insert(item)
tree.printTree(root)
print("--------------------------------------------------")
print("Min :",tree.getMin())
print("Max :",tree.getMax())
