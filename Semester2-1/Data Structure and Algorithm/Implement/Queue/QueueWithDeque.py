# Implement Queue with Deque ### >> Low Cost with deQueue Method [O(1)]
from collections import deque

class Queue:
    def __init__(self, items=None):
        if items is None:
            self.items = deque()
        else:
            self.items = deque(items)

    def enQueue(self, item):
        self.items.append(item)

    def deQueue(self):
        return self.items.popleft()

    def size(self):
        return len(self.items)

    def isEmpty(self):
        return len(self.items) == 0

    def getItems(self):
        return self.items
