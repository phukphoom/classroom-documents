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

    def count_LE(self, root, indicator):
        queue = []
        queue.append(root)
        count = 0
        while len(queue) != 0:
            if queue[0].data <= indicator:
                count += 1
            if queue[0].left is not None:
                queue.append(queue[0].left)
            if queue[0].right is not None:
                queue.append(queue[0].right)
            queue.pop(0)
        return count

    def printTree(self, node, level=0):
        if node != None:
            self.printTree(node.right, level + 1)
            print('     ' * level, node)
            self.printTree(node.left, level + 1)

### Main ###
inputList, indicator = input('Enter Input : ').split('/')
inputList = list(map(int, inputList.split()))
indicator = int(indicator)

tree = BinarySearchTree()
for item in inputList:
    root = tree.insert(item)
tree.printTree(root)
print("--------------------------------------------------")
print(tree.count_LE(root, indicator))
