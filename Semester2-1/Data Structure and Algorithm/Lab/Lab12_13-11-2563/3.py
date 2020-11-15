### Class ###
class Data:
    def __init__(self, key, value):
        self.key = key
        self.value = value

    def __str__(self):
        return "({0}, {1})".format(self.key, self.value)

class Hash:
    def __init__(self, table_size, max_collision):

        self.table = [None]*table_size
        self.tableSize = table_size
        self.numData = 0
        self.maxCollision = max_collision

    def addData(self, key, value):

        index = self.hashing(key)

        if index != -1:
            self.table[index] = Data(key, value)
            self.numData += 1
        self.printHashTable()

    def isFull(self):

        return self.numData == self.tableSize

    def hashing(self, key):

        sumAscii = 0
        for char in key:
            sumAscii += ord(char)

        index = sumAscii % tableSize

        countCollision = 0
        old_index = index
        while self.table[index] is not None and countCollision < self.maxCollision:
            countCollision += 1
            print("collision number {} at {}".format(countCollision, index))
            index = self.quadraticFunction(old_index, countCollision)

        if countCollision == self.maxCollision:
            print("Max of collisionChain")
            return -1
        else:
            return index

    def quadraticFunction(self, old_index, n):

        return (old_index + n**2) % self.tableSize

    def printHashTable(self):

        for i in range(self.tableSize):
            print("#{}\t{}".format(i+1, self.table[i]))

        print("---------------------------")


### Main ###
print(" ***** Fun with hashing *****")
inp = input("Enter Input : ").split('/')

tableSize, maxCollision = list(map(int, inp[0].split()))
string = [item.split() for item in inp[1].split(',')]

hash = Hash(tableSize, maxCollision)
for item in string:

    if hash.isFull():
        print("This table is full !!!!!!")
        break

    else:
        key, value = item
        hash.addData(key, value)
