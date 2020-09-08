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

    def top(self):
        return self.items[-1]

    def size(self):
        return len(self.items)
        
    def isEmpty(self):
        return len(self.items) == 0

### Main ###
inputString = input("Enter Input : ")

bracketStack = Stack()
for item in inputString:
    if(bracketStack.isEmpty()):
        bracketStack.push(item)
    else:
        if bracketStack.top()=='(' and item == ')':
            bracketStack.pop()
        elif bracketStack.top()=='{' and item == '}':
            bracketStack.pop()
        elif bracketStack.top()=='[' and item == ']':
            bracketStack.pop()
        else:
            bracketStack.push(item)

print(bracketStack.size())
if(bracketStack.isEmpty()):
    print("Perfect ! ! !")