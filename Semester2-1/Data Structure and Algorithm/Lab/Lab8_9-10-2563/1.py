### Class ###
class Stack:
    def __init__(self, items=None):
        if items is None:
            self.items = []
        else:
            self.items = items

    def __str__(self):
        returnString = "Data in Stack is : "
        for i in range(len(self.items)):
            returnString += str(self.items[i]) + " "
        return returnString

    def push(self, item):
        self.items.append(item)

    def pop(self):
        self.items.pop()

    def isEmpty(self):
        return len(self.items) == 0

    def size(self):
        return len(self.items)

    def peek(self):
        return self.items[-1]

    def bottom(self):
        return self.items[0]

### Main ###
choice = int(input("Enter choice : "))
if choice == 1:
    s1 = Stack()
    s1.push(10)
    s1.push(20)
    print(s1)
    s1.pop()
    s1.push(30)
    print("Peek of stack :", s1.peek())
    print("Bottom of stack :", s1.bottom())
elif choice == 2:
    s1 = Stack()
    s1.push(100)
    s1.push(200)
    s1.push(300)
    s1.pop()
    print(s1)
    print("Stack is Empty :", s1.isEmpty())
elif choice == 3:
    s1 = Stack()
    s1.push(11)
    s1.push(22)
    s1.push(33)
    s1.pop()
    print(s1)
    print("Stack size :", s1.size())
