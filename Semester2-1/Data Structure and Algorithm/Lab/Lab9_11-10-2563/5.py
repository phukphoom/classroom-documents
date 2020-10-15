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

    def printTree(self, node, level=0):
        if node != None:
            self.printTree(node.right, level + 1)
            print('     ' * level, node)
            self.printTree(node.left, level + 1)

    def preOrder(self, root):
        if root is None:
            return

        print(root.data, end='')
        self.preOrder(root.left)
        self.preOrder(root.right)

    def inOrder(self, root):
        if root is None:
            return

        if root.data in ['+', '-', '*', '/']:
            print('(', end='')

        self.inOrder(root.left)
        print(root.data, end='')
        self.inOrder(root.right)

        if root.data in ['+', '-', '*', '/']:
            print(')', end='')

    def makeExpressionTree(self, postfix):
        stack = []

        # Traverse through every character of input expression
        for char in postfix:

            # if operand, simply push into stack
            if char not in ['+', '-', '*', '/']:
                newNode = Node(char)
                stack.append(newNode)

            # Operator
            else:
                # Pop two top nodes
                newNode = Node(char)
                node_1 = stack.pop()
                node_2 = stack.pop()

                # make them children
                newNode.left = node_2
                newNode.right = node_1

                # Add this subexpression to stack
                stack.append(newNode)

        # Only element  will be the root of expression tree
        self.root = stack[-1]


### Main ###
postfix = input('Enter Postfix : ')
tree = BinarySearchTree()
tree.makeExpressionTree(postfix)

print("Tree :")
tree.printTree(tree.root)

print("--------------------------------------------------")
print("Infix :", end=' ')
tree.inOrder(tree.root)
print()

print("Prefix :", end=' ')
tree.preOrder(tree.root)
print()
