### Class ###
class Stack:
    def __init__(self, items=None):
        if items is None:
            self.items = []
        else:
            self.items = items

    def push(self, item):
        self.items.append(item)

    def pop(self):
        return self.items.pop()

    def peek(self):
        return self.items[-1]

    def size(self):
        return len(self.items)

    def isEmpty(self):
        return len(self.items) == 0

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

    ## >> HackQueue
    def enQueueFront(self,item):
        self.items.insert(0,item)

### Main ###
redStorage, blueStorage = input("Enter Input (Red, Blue) : ").split()
redStorage = Queue(list(redStorage))
blueStorage = Stack(list(blueStorage))

#######################################################################################
# >> Set Blue Bomb
blueAlreadyBomb = Queue()
blueLeftBomb = Stack()
blueExplosive = 0

tempQueue = Queue()
while not blueStorage.isEmpty():
    if tempQueue.isEmpty():
        tempQueue.enQueue(blueStorage.pop())
    else:
        if tempQueue.peek() == blueStorage.peek():
            tempQueue.enQueue(blueStorage.pop())
            if tempQueue.size() == 3:
                blueAlreadyBomb.enQueue(tempQueue.deQueue())
                while not tempQueue.isEmpty():
                    tempQueue.deQueue()
                while not blueLeftBomb.isEmpty():
                    blueStorage.push(blueLeftBomb.pop())
        else:
            while not tempQueue.isEmpty():
                blueLeftBomb.push(tempQueue.deQueue())
            tempQueue.enQueue(blueStorage.pop())

while not tempQueue.isEmpty():
    blueLeftBomb.push(tempQueue.deQueue())

blueExplosive = blueAlreadyBomb.size()
#######################################################################################
# >> Simulate Boom at Red
redLeftBomb = Stack()
redExplosive = 0
blueMistake = 0

tempQueue = Queue()
while not redStorage.isEmpty():
    if tempQueue.isEmpty():
        tempQueue.enQueue(redStorage.deQueue())
    else:
        if tempQueue.peek() == redStorage.peek():
            tempQueue.enQueue(redStorage.deQueue())
            if tempQueue.size() == 3:
                if not blueAlreadyBomb.isEmpty():
                    if tempQueue.peek() == blueAlreadyBomb.peek():
                        tempQueue.deQueue()
                        tempQueue.deQueue()
                        blueAlreadyBomb.deQueue()
                        redLeftBomb.push(tempQueue.deQueue())
                        blueMistake += 1
                    else:
                        redLeftBomb.push(tempQueue.deQueue())
                        redLeftBomb.push(tempQueue.deQueue())
                        redLeftBomb.push(blueAlreadyBomb.deQueue())
                        redLeftBomb.push(tempQueue.deQueue())
                else:
                    tempQueue.deQueue()
                    tempQueue.deQueue()
                    tempQueue.deQueue()
                    redExplosive += 1
                while not redLeftBomb.isEmpty():
                    redStorage.enQueueFront(redLeftBomb.pop()) ## >> HackQueue
            
        else:
            while not tempQueue.isEmpty():
                redLeftBomb.push(tempQueue.deQueue())
            tempQueue.enQueue(redStorage.deQueue())
while not tempQueue.isEmpty():
    redLeftBomb.push(tempQueue.deQueue())

#######################################################################################
# >> Display
print('Red Team :')
print(redLeftBomb.size())
if not redLeftBomb.isEmpty():
    while not redLeftBomb.isEmpty():
        print(redLeftBomb.pop(), end='')
    print()
else:
    print("Empty")
print('{} Explosive(s) ! ! ! (HEAT)'.format(redExplosive))
if blueMistake != 0:
    print('Blue Team Made (a) Mistake(s) {} Bomb(s)'.format(blueMistake))


print('----------TENETTENET----------')


print(': maeT eulB')
print(blueLeftBomb.size())
if not blueLeftBomb.isEmpty():
    while not blueLeftBomb.isEmpty():
        print(blueLeftBomb.pop(), end='')
    print()
else:
    print("ytpmE")
print('(EZEERF) ! ! ! (s)evisolpxE {}'.format(blueExplosive))

