### Class ###
class Stack:
    def __init__(self,items=None):
        if items is None:
            self.items = []
        else:
            self.items = items

    def push(self,item):
        self.items.append(item)

    def pop(self):
        return self.items.pop()

    def peek(self):
        return self.items[-1]

    def size(self):
        return len(self.items)
        
    def isEmpty(self):
        return len(self.items) == 0

### Main ###
commandList = input("Enter Input : ").split(',');

treeHeightStack = Stack()
for command in commandList:
    option = command.split()[0]
    if option == 'A':
        treeHeight = int(command.split()[1])
        
        if treeHeightStack.isEmpty():
            treeHeightStack.push(treeHeight)
        else:
            if treeHeight<treeHeightStack.peek():
                treeHeightStack.push(treeHeight)
            else:
                while not treeHeightStack.isEmpty() and treeHeight >= treeHeightStack.peek():
                    treeHeightStack.pop()
                treeHeightStack.push(treeHeight)
        
    elif option == 'B':
        print(treeHeightStack.size())