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

    def isHave(self,item):
        return item in self.items

### Main ###
print("******** Parking Lot ********")
maxPark,parkedCars,option,car = input("Enter max of car,car in soi,operation : ").split()

#Casting to Int
maxPark = int(maxPark)
car = int(car)

#Create parkedStack
if parkedCars!='0':
    parkingStack = Stack(list(map(int,parkedCars.split(','))))
else:
    parkingStack = Stack()

#Run Command
if option == 'arrive':
    if maxPark == parkingStack.size():
        print("car {} cannot arrive : Soi Full".format(car))
    else:
        if parkingStack.isHave(car):
            print("car {} already in soi".format(car))
        else:
            parkingStack.push(car)
            print("car {} arrive! : Add Car {}".format(car,car))
elif option == 'depart':
    if parkingStack.isEmpty():
        print("car {} cannot depart : Soi Empty".format(car))
    else:
        if parkingStack.isHave(car):
            tempStack = Stack()
            while parkingStack.top() != car:
                tempStack.push(parkingStack.pop())
            parkingStack.pop()
            while not tempStack.isEmpty():
                parkingStack.push(tempStack.pop())
            print("car {} depart ! : Car {} was remove".format(car,car))
        else:
            print("car {} cannot depart : Dont Have Car {}".format(car,car))
print(parkingStack.items)