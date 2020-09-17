### Class ###
class Node:
    def __init__(self, data, next=None):
        self.data = data
        self.next = next

    def __str__(self):
        return str(self.data)

class SinglyLinkedList:
    def __init__(self):
        self.head = Node(None, None)
        self.size = 0

    def __str__(self):
        current = self.head.next
        string = ""
        count = 0
        while current is not None:
            string += str(current.data) + " "
            current = current.next

            if count>=self.size:
                return "Found Loop"
            count +=1

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

    def setNextOnNode(self,src_position,des_position):
        current_src = self.head
        for i in range(src_position+1):
            current_src = current_src.next

        current_des = self.head
        for i in range(des_position+1):
            current_des = current_des.next

        print("Set node.next complete!, index:value = {}:{} -> {}:{}".format(src_position,current_src.data,des_position,current_des))
        current_src.next = current_des

### Main ###
commandList = input("Enter input : ").split(',')

singlyLinkedList = SinglyLinkedList()
for command in commandList:
    option = command.split()[0]

    if option == 'A':
        param = command.split()[1]
        singlyLinkedList.append(param)
        print(singlyLinkedList)

    elif option == 'S':
        firstParam,secondParam = command.split()[1].split(':')
        firstParam = int(firstParam)
        secondParam = int(secondParam)
        if singlyLinkedList.isEmpty():
            print("Error! {list is empty}")
        else:
            if firstParam >= singlyLinkedList.size or firstParam < 0:
                print("Error! {index not in length}:",firstParam)
            else:
                if secondParam >= singlyLinkedList.size or secondParam < 0:
                    singlyLinkedList.append(secondParam)
                    print("index not in length, append :",secondParam)
                else:
                    singlyLinkedList.setNextOnNode(firstParam,secondParam)

if str(singlyLinkedList) != "Found Loop":
    print("No Loop")
print(singlyLinkedList)