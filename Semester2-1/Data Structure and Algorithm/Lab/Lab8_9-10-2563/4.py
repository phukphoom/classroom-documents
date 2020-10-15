### Class ###
class LinkedList:
    class Node :
        def __init__(self,data,next = None) :
            self.data = data
            if next is None :
                self.next = None
            else :
                self.next = next
                
        def __str__(self) :
            return str(self.data)

    def __init__(self,head = None):
        if head == None:
            self.head = self.tail = None
            self.size = 0
        else:
            self.head = head
            t = self.head        
            self.size = 1
            while t.next != None :
                t = t.next
                self.size += 1
            self.tail = t
            
    def __str__(self) :
        s = 'Linked data : '
        p = self.head
        while p != None :
            s += str(p.data)+' '
            p = p.next
        return s

    def __len__(self) :
        return self.size
    
    def append(self, data):
        p = self.Node(data)
        if self.head == None:
            self.head = self.tail = p
        else:
            t = self.tail
            t.next = p   
            self.tail =p  
        self.size += 1

    def removeHead(self) :
        if self.head == None : return
        if self.head.next == None :
            p = self.head
            self.head = None
        else :
            p = self.head
            self.head = self.head.next
        self.size -= 1
        return p.data
    
    def isEmpty(self) :
        return self.size == 0
    
    def nodeAt(self,i) :
        p = self.head
        for j in range(i) :
            p = p.next
        return p

    def contentEquivalence(self,other):
        sumSelf = 0
        currentSelf = self.head
        while currentSelf != None:
            sumSelf += ord(currentSelf.data)
            currentSelf = currentSelf.next
        
        sumOther = 0
        currentOther = other.head
        while currentOther != None:
            sumOther += ord(currentOther.data)
            currentOther = currentOther.next
        
        return sumSelf==sumOther
        
### Main ###
inputList1,inputList2 = input("List1,List2 : ").split(',')
inputList1 = inputList1.split()
inputList2 = inputList2.split()

list1 = LinkedList()
list2 = LinkedList()

for item in inputList1:
    list1.append(item)
for item in inputList2:
    list2.append(item)

print("List1 content Equivalence List2 :",list1.contentEquivalence(list2))