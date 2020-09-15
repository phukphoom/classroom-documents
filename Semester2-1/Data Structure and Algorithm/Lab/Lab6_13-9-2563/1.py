### Class ###
class Node:
    def __init__(self, data):
        self.data = data
        self.next = None

class SinglyLinkedList:
    def __init__(self):
        self.head = None

    def __str__(self):
        if self.isEmpty():
            return "Empty"
        current, string = self.head, str(self.head.data) + " "
        while current.next != None:
            string += str(current.next.data) + " "
            current = current.next
        return string

    def isEmpty(self):
        return self.head == None

    def append(self, item):
        if self.isEmpty():
            self.head = Node(item)
        else:
            current = self.head
            while current.next is not None:
                current = current.next
            current.next = Node(item)

    def addHead(self, item):
        newNode = Node(item)
        newNode.next = self.head
        self.head = newNode

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
                return "Success"
            else:
                return "Out of Range"
        else:
            previous = None
            index = 0
            while current is not None:
                if index == pos:
                    previous.next = current.next
                    return "Success"
                index += 1
                previous = current
                current = current.next
            return "Out of Range"

### Main ###
L = SinglyLinkedList()
inp = input('Enter Input : ').split(',')
for i in inp:
    if i[:2] == "AP":
        L.append(i[3:])
    elif i[:2] == "AH":
        L.addHead(i[3:])
    elif i[:2] == "SE":
        print("{0} {1}".format(L.search(i[3:]), i[3:]), end='')
        print(" in", L)
    elif i[:2] == "SI":
        print("Linked List size = {0} : {1}".format(L.size(), L))
    elif i[:2] == "ID":
        print("Index ({0}) = {1} : {2}".format(i[3:], L.index(i[3:]), L))
    elif i[:2] == "PO":
        before = "{}".format(L)
        k = L.pop(int(i[3:]))
        print(("{0} | {1}-> {2}".format(k, before, L)) if k ==
              "Success" else ("{0} | {1}".format(k, L)))
print("Linked List :", L)
