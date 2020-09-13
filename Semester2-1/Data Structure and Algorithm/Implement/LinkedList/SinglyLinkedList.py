class Node:
    def __init__(self, data, next=None):
        self.data = data
        self.next = next

### SinglyLinkedList with Dummy ###
class SinglyLinkedList:
    def __init__(self):
        self.head = Node(None, None)
        self.size = 0

    def __str__(self):
        current = self.head.next
        string = ""
        while current is not None:
            string += str(current.data) + " "
            current = current.next

        if string == "":
            return "Empty"
        else:
            return "->".join(string.split())

    def isEmpty(self):
        return self.size == 0

    def append(self, data):
        current = self.head
        while current.next is not None:
            current = current.next
        current.next = Node(data, None)
        self.size += 1

    def insert(self, pos, data):
        if pos >= 0 and pos < self.size:
            current = self.head
            previous = None
            for i in range(pos+1):
                previous = current
                current = current.next
            previous.next = Node(data, current)
            self.size += 1
        else:
            print(">> Can't insert! You inserted at wrong position.")

    def pop(self):
        try:
            current = self.head
            previous = None
            while current.next is not None:
                previous = current
                current = current.next
            previous.next = None
            self.size -= 1
        except AttributeError:
            print(">> Can't pop! List is empty. ")

    def delete(self, pos):
        try:
            current = self.head
            previous = None
            for i in range(pos+1):
                previous = current
                current = current.next
            previous.next = current.next
            self.size -= 1
        except AttributeError:
            print(">> Can't delete! You deleted at wrong position.")

    def remove(self, data):
        try:
            current = self.head
            previous = None
            while current.data != data:
                previous = current
                current = current.next
            previous.next = current.next
            self.size -= 1
        except AttributeError:
            print(">> Can't remove! List not have {}.".format(data))
