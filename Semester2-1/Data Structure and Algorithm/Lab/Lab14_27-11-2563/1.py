### Class ###
class TreeNode(object):
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None

def list_to_bst(list_nums):
    if len(list_nums) == 1:
        return TreeNode(list_nums[0])
    if len(list_nums) == 0:
        return None

    center = len(list_nums) //2
    leftList = list_nums[0:center]
    rightList = list_nums[center+1:]

    node = TreeNode(list_nums[center])
    node.left = list_to_bst(leftList)
    node.right = list_to_bst(rightList)

    return node

def preOrder(node): 
    if not node: 
        return      
    print(node.val)
    preOrder(node.left) 
    preOrder(node.right)   

def printBST(node,level = 0):

    if node != None:
        printBST(node.right, level + 1)
        print('     ' * level, node.val)
        printBST(node.left, level + 1)

### Main ###
list_nums = sorted([int(item) for item in input("Enter list : ").split()])
result = list_to_bst(list_nums)
print("\nList to a height balanced BST : ")
print(preOrder(result))
print("\nBST model : ")
printBST(result)