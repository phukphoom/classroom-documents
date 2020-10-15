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

    def preOrder(self, root):
        if root is None:
            return

        print(root.data, end=' ')
        self.preOrder(root.left)
        self.preOrder(root.right)

    def inOrder(self, root):
        if root is None:
            return

        self.inOrder(root.left)
        print(root.data, end=' ')
        self.inOrder(root.right)

    def postOrder(self, root):
        if root is None:
            return

        self.postOrder(root.left)
        self.postOrder(root.right)
        print(root.data, end=' ')

    def breadthFirstSearch(self, root):
        queue = []
        queue.append(root)
        while len(queue) != 0:
            print(queue[0].data, end=' ')
            if queue[0].left is not None:
                queue.append(queue[0].left)
            if queue[0].right is not None:
                queue.append(queue[0].right)
            queue.pop(0)


### Main ###
inputList = [int(item) for item in input('Enter Input : ').split()]
tree = BinarySearchTree()
for item in inputList:
    root = tree.insert(item)

print("Preorder :", end=' ')
tree.preOrder(root)
print()

print("Inorder :", end=' ')
tree.inOrder(root)
print()

print("Postorder :", end=' ')
tree.postOrder(root)
print()

print("Breadth :", end=' ')
tree.breadthFirstSearch(root)
print()
