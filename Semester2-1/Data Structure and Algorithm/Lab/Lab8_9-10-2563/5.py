### Class ###
class LinkedList:
    class Node:
        def __init__(self, data, next=None):
            self.data = data
            if next is None:
                self.next = None
            else:
                self.next = next

        def __str__(self):
            return str(self.data)

    def __init__(self, head=None):
        if head == None:
            self.head = self.tail = None
            self.size = 0
        else:
            self.head = head
            t = self.head
            self.size = 1
            while t.next != None:
                t = t.next
                self.size += 1
            self.tail = t

    def __str__(self):
        s = 'Linked data : '
        p = self.head
        while p != None:
            s += str(p.data)+' '
            p = p.next
        return s

    def __len__(self):
        return self.size

    def append(self, data):
        p = self.Node(data)
        if self.head == None:
            self.head = self.tail = p
        else:
            t = self.tail
            t.next = p
            self.tail = p
        self.size += 1

    def removeHead(self):
        if self.head == None:
            return
        if self.head.next == None:
            p = self.head
            self.head = None
        else:
            p = self.head
            self.head = self.head.next
        self.size -= 1
        return p.data

    def isEmpty(self):
        return self.size == 0

    def nodeAt(self, i):
        p = self.head
        for j in range(i):
            p = p.next
        return p

    def BBsort(self):
        for i in range(len(self)-1):
            for j in range(len(self)-i-1):
                if self.nodeAt(j).data > self.nodeAt(j+1).data:
                    self.nodeAt(j).data, self.nodeAt(
                        j+1).data = self.nodeAt(j+1).data, self.nodeAt(j).data

    def mode(self):
        returnLinkedList = LinkedList()

        keys = set()
        for i in range(len(self)):
            keys.add(self.nodeAt(i).data)
        
        countDict = dict()
        for key in keys:
            if key not in countDict.keys():
                countDict[key] = 0
        for i in range(len(self)):
            countDict[self.nodeAt(i).data] += 1

        for key in keys:
            if countDict[key] == max(countDict.values()):
                returnLinkedList.append(key)

        returnLinkedList.BBsort()
        
        returnString = ""
        for i in range(len(returnLinkedList)):
            returnString += str(returnLinkedList.nodeAt(i).data) + ' '

        if max(countDict.values()) == 1:
            return "Mode is not available."
        else:
            return "Mode =  " + returnString

### Main ###
inputlist = [int(e) for e in input('Enter numbers : ').split()]

linkedList = LinkedList()

for item in inputlist:
    linkedList.append(item)

linkedList.BBsort()
print("Output :")
print(linkedList)
print("Amount of data =", len(linkedList))
print(linkedList.mode())
