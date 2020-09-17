### Class ###
class Node:
    def __init__(self, data, next=None):
        self.data = data
        self.next = next

    def __str__(self):
        return str(self.data)

class SinglyLinkedList:
    def __init__(self):
        self.head = None

    def __str__(self):
        if self.isEmpty():
            return ""
        current, string = self.head, str(self.head.data) + " "
        while current.next != None:
            string += str(current.next.data) + " "
            current = current.next
        return string

    def isEmpty(self):
        return self.head == None

    def addHead(self, item):
        newNode = Node(item)
        newNode.next = self.head
        self.head = newNode

    def append(self, item):
        if self.isEmpty():
            self.head = Node(item)
        else:
            current = self.head
            while current.next is not None:
                current = current.next
            current.next = Node(item)
    def addWithSortMax(self,data):
        current = self.head
        previous = None
        while current is not None and current.data > data:
            previous = current
            current = current.next
        if previous is not None:
            previous.next = Node(data,current)
        else:
            self.head = Node(data,current)
        
    def search(self, item):
        current = self.head
        while current is not None:
            if current.value == item:
                return "Found"
            current = current.next
        return "Not Found"

    def index(self, item):
        current = self.head
        index = 0
        while current is not None:
            if current.value == item:
                return index
            index += 1
            current = current.next
        return -1

    def size(self):
        current = self.head
        size = 0
        while current is not None:
            size += 1
            current = current.next
        return size

    def pop(self, pos):
        current = self.head
        if pos == 0:
            if not self.isEmpty():
                self.head = self.head.next
                return current
            else:
                return "Out of Range"
        else:
            previous = None
            index = 0
            while current is not None:
                if index == pos:
                    previous.next = current.next
                    return current
                index += 1
                previous = current
                current = current.next
            return "Out of Range"

### Function ###
def radixSort(input_list):
    beforLinkedList = SinglyLinkedList()
    mainLinkedList = SinglyLinkedList()
    for item in input_list:
        beforLinkedList.append(item)
        mainLinkedList.append(item)
    maxBits = getMaxBit(max(input_list))
    nestLinkedList = [SinglyLinkedList(),SinglyLinkedList(),SinglyLinkedList(),SinglyLinkedList(),SinglyLinkedList(),SinglyLinkedList(),SinglyLinkedList(),SinglyLinkedList(),SinglyLinkedList(),SinglyLinkedList()]
    countRound = 0
    for i in range(1,maxBits+2):
        countRound += 1
        while not mainLinkedList.isEmpty():
            number = mainLinkedList.pop(0).data
            valueDigit = getDigitValue(number,i)
            nestLinkedList[valueDigit].addWithSortMax(number)

        print("------------------------------------------------------------")
        print("Round : {}".format(countRound))
        for i in range(10):
            print("{} : {}".format(i,nestLinkedList[i]))

        sumStatus = 0
        for i in range(1,10):
            sumStatus += not nestLinkedList[i].isEmpty()
        if sumStatus == 0:
            for i in range(10):
                while not nestLinkedList[i].isEmpty():
                    mainLinkedList.append(nestLinkedList[i].pop(0).data)
            break

        for i in range(10):
            while not nestLinkedList[i].isEmpty():
                mainLinkedList.append(nestLinkedList[i].pop(0).data)
    print("------------------------------------------------------------")
    print("{} Time(s)".format(countRound-1))
    print("Before Radix Sort : {}".format(" -> ".join(str(beforLinkedList).split())))
    print("After  Radix Sort : {}".format(" -> ".join(str(mainLinkedList).split())))

def getDigitValue(number,digit):
    if number < 0 :
        number *= -1

    for i in range(digit-1):
        number //= 10
    return number%10

def getMaxBit(number):
    if number < 0 :
        number *= -1

    count = 0
    while number > 0:
        number //= 10
        count += 1
    return count

### Main ###
inputList = list(map(int,input("Enter Input : ").split()))
radixSort(inputList)
