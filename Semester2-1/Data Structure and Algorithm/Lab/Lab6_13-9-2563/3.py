### Class ###
class Node:
    def __init__(self, data, next=None):
        self.data = data
        self.next = next

    def __str__(self):
        return str(self.data)

### Function ###
def createList(input_list=None):
    if input_list == None:
        list = []
    else:
        list = input_list

    head = Node(list[0],None)
    current = head
    for data in input_list[1:]:
        newNode = Node(data,None)
        current.next = newNode
        current = current.next

    return head

def printList(head):
    current = head
    while current is not None:
        print("{} ".format(current),end='')
        current = current.next
    print()

def mergeOrderesList(head_1, head_2):
    current_1 = head_1
    current_2 = head_2

    mergeHead = Node(None,None)
    mergeCurrent = mergeHead
    while current_1 is not None and current_2 is not None:
        if current_1.data <= current_2.data:
            mergeCurrent.next = current_1
            current_1 = current_1.next
        else :
            mergeCurrent.next = current_2
            current_2 = current_2.next
        mergeCurrent = mergeCurrent.next
    
    while current_1 is not None:
        mergeCurrent.next = current_1
        current_1 = current_1.next
        mergeCurrent = mergeCurrent.next
    
    while current_2 is not None:
        mergeCurrent.next = current_2
        current_2 = current_2.next
        mergeCurrent = mergeCurrent.next
    
    mergeHead = mergeHead.next
    return mergeHead

### Main ###
listText_1, listText_2 = input("Enter 2 Lists : ").split()
LL1 = createList(list(map(int,listText_1.split(','))))
LL2 = createList(list(map(int,listText_2.split(','))))

print('LL1 : ',end='')
printList(LL1)
print('LL2 : ',end='')
printList(LL2)

m = mergeOrderesList(LL1,LL2)
print('Merge Result : ',end='')
printList(m)