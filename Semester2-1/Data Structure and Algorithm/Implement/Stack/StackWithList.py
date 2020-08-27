### Implement Stack with List ###
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