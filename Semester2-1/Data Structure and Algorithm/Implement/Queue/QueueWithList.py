# Implement Queue with List ### >> High Cost with deQueue Method [O(n)]
class Queue:
    def __init__(self, items=None):
        if items is None:
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

