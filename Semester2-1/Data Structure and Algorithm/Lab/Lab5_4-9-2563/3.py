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

    def peek(self):
        return self.items[0]

    def size(self):
        return len(self.items)

    def isEmpty(self):
        return len(self.items) == 0

### Function ###
def encodemsg(string_queue, code_queue):
    for i in range(string_queue.size()):
        if string_queue.peek().islower():
            string_queue.enQueue(chr((ord(string_queue.deQueue())-ord('a')+code_queue.peek())%26 + ord('a')))

        elif string_queue.peek().isupper():
            string_queue.enQueue(chr((ord(string_queue.deQueue())-ord('A')+code_queue.peek())%26 + ord('A')))

        code_queue.enQueue(code_queue.deQueue())
    print('Encode message is :  {}'.format(string_queue.items))

def decodemsg(string_queue, code_queue):
    for i in range(string_queue.size()):
        if string_queue.peek().islower():
            string_queue.enQueue(chr((ord(string_queue.deQueue())-ord('a')-code_queue.peek())%26 + ord('a')))

        elif string_queue.peek().isupper():
            string_queue.enQueue(chr((ord(string_queue.deQueue())-ord('A')-code_queue.peek())%26 + ord('A')))

        code_queue.enQueue(code_queue.deQueue())
    print('Decode message is :  {}'.format(string_queue.items))

### Main ###
string, code = input("Enter String and Code : ").split(',')
string = ''.join(string.split())

stringQueue = Queue(list(string))
encodemsg(stringQueue, Queue(list(map(int, code))))
decodemsg(stringQueue, Queue(list(map(int, code))))

