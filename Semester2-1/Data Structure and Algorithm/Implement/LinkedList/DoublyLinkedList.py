class Node:
    def __init__(self, data, prev=None, next=None):
        self.data = data
        self.prev = prev
        self.next = next

### DoublyLinkedList with Dummy ###
class DoublyLinkedList:
    def __init__(self):
        self.head = Node(None, None, None)
        self.tail = Node(None, self.head, None)
        self.head.next = self.tail
        self.size = 0

    def __str__(self):
        current = self.head.next
        string = ""
        while current is not self.tail:
            string += str(current.data) + " "
            current = current.next

        if string == "":
            return "Empty"
        else:
            return "->".join(string.split())

    def printReverse(self):
        current = self.tail.prev
        string = ""
        while current is not self.head:
            string += str(current.data) + " "
            current = current.prev

        if string == "":
            return "Empty"
        else:
            return "->".join(string.split())

    def isEmpty(self):
        return self.size == 0

    def append(self, data):
        newNode = Node(data, self.tail.prev, self.tail)
        self.tail.prev.next = newNode
        self.tail.prev = newNode
        self.size += 1

    def insert(self, pos, data):
        if pos >= 0 and pos <= self.size:
            current = self.head
            for i in range(pos+1):
                current = current.next
            current.prev.next = Node(data, current.prev,current)
            self.size += 1
        else:
            print(">> Can't insert! You inserted at wrong position.")

    def pop(self):
        try:
            self.tail.prev.prev.next = self.tail
            self.tail.prev = self.tail.prev.prev
            self.size -= 1
        except AttributeError:
            print(">> Can't pop! List is empty. ")

    def delete(self, pos):
        try:
            current = self.head
            for i in range(pos+1):
                current = current.next
            current.prev.next = current.next
            self.size -= 1

        except AttributeError:
            print(">> Can't delete! You deleted at wrong position.")

    def remove(self, data):
        try:
            current = self.head
            while current.data != data:
                current = current.next
            current.prev.next = current.next
            self.size -= 1
        except AttributeError:
            print(">> Can't remove! {} is not in List.".format(data))