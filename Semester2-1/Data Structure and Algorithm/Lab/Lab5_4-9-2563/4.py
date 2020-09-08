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

    def front(self):
        return self.items[0]
    
    def raer(self):
        return self.items[-1]

    def size(self):
        return len(self.items)

    def isEmpty(self):
        return len(self.items) == 0

### Main ###
dataList, commandList = input("Enter Input : ").split('/')
dataList = [item.split() for item in dataList.split(',')]
commandList = [item.split() for item in commandList.split(',')]

#> Make Data  employee in form {empId:groupId,...}
empWithGroup = {}
for data in dataList:
    empWithGroup[data[1]] = data[0]

#> Make mainQueue in form {GroupId:(Queue of employees),...}
mainQueueDict = {}
for command in commandList:
    option = command[0]

    if option == 'E':
        empId = command[1]

        if mainQueueDict.get(empWithGroup[empId]) is None:
            mainQueueDict[empWithGroup[empId]] = Queue()
        mainQueueDict[empWithGroup[empId]].enQueue(empId)

    elif option == 'D':
        if len(mainQueueDict) == 0:
            print("Empty")
        else:
            keys = list(mainQueueDict.keys())
            print(mainQueueDict[keys[0]].deQueue())
            if mainQueueDict[keys[0]].isEmpty():
                del mainQueueDict[keys[0]]
