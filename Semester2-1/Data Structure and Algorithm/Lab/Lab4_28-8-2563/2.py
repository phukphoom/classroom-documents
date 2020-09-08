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
inputData= input("Enter Input : ").split(',')
inputDataNest = []
for item in inputData:
    inputDataNest.append(list(map(int,item.split())))

plateStack = Stack()
for item in inputDataNest:
    if plateStack.isEmpty():
        plateStack.push(item)
    else:
        while not plateStack.isEmpty() and item[0] > plateStack.top()[0] :
            print(plateStack.pop()[1])
        plateStack.push(item)