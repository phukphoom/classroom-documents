### Class ###
class Queue:
    def __init__(self, items=None):
        if items == None:
            self.items = []
        else:
            self.items = items

    def enQueue(self, item):
        self.items.append(item)

    def deQueue(self):
        return self.items.pop(0)
    
    def peek(self):
        return self.items[0]

    def size(self):
        return len(self.items)

    def isEmpty(self):
        return len(self.items) == 0

### Main ###
commandList = input("Enter Input : ").split(',')

mainQueue = Queue()
subQueue = Queue()
displayMainItems,displaySubItems = 'Empty','Empty'

for command in commandList:
    
    option = command.split()[0]

    if option == 'E':
        mainQueue.enQueue(command.split()[1])
        displayMainItems = ', '.join(mainQueue.items)

        print(displayMainItems)

    elif option == 'D':
        if not mainQueue.isEmpty():
            value = mainQueue.deQueue()
            
            if not mainQueue.isEmpty():
                displayMainItems = ', '.join(mainQueue.items)
            else:
                displayMainItems = 'Empty'

            subQueue.enQueue(value)
            displaySubItems = ', '.join(subQueue.items)

            print('{} <- {}'.format(value, displayMainItems))
        else:
            print(displayMainItems)

print('{} : {}'.format(displaySubItems,displayMainItems))