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
inputString = input("Enter Input : ").split()

score = 0
colorStack = Stack()
for item in inputString:
    
    if colorStack.isEmpty():
        colorStack.push([item,1])
    else:
        topItem,topItamCount = colorStack.peek()
        if item == topItem:
            if topItamCount == 2:
                for i in range(2):
                    colorStack.pop()
                score += 1
            else:
                colorStack.push([item,topItamCount+1])
        else:
            colorStack.push([item,1])
#> Display Output
print(colorStack.size())
if colorStack.size() == 0:
    print("Empty")
else:
    while not colorStack.isEmpty():
        print(colorStack.pop()[0],end="")
    print()
if score >= 2:
    print("Combo : {} ! ! !".format(score))