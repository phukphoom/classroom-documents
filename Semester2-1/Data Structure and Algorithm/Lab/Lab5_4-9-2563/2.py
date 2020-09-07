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

commonQueue = Queue()
vipQueue = Queue()

for command in commandList:
    option = command.split()[0]

    if option == 'EN':
        commonQueue.enQueue(command.split()[1])

    elif option == 'ES':
        vipQueue.enQueue(command.split()[1])

    elif option =='D':
        if not vipQueue.isEmpty():
            print(vipQueue.deQueue())
        else:
            if not commonQueue.isEmpty():
                print(commonQueue.deQueue())
            else:
                print('Empty')
