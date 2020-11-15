### Class ###
class Hash:
    def __init__(self, table_size, max_collision, threshold):

        self.table = [None]*table_size
        self.tableSize = table_size
        self.numData = 0
        self.addOrder = []
        self.maxCollision = max_collision
        self.thresHold = threshold

        print("Initial Table :")
        self.printHashTable()

    def addData(self, data):
        print("Add : {}".format(data))

        if self.isOverTreshold(self.numData+1):
            print("****** Data over threshold - Rehash !!! ******")
            self.reHash()

        index = self.hashing(data)
        self.table[index] = data
        self.addOrder.append(data)
        self.numData += 1

        self.printHashTable()

    def isOverTreshold(self, num):
        return (num/self.tableSize)*100 > threshold

    def hashing(self, data):

        index = self.quadraticFunction(data,0)

        countCollision = 0
        old_index = index
        while self.table[index] is not None:
            countCollision += 1

            print("collision number {} at {}".format(countCollision, index))

            if countCollision == self.maxCollision:
                print("****** Max collision - Rehash !!! ******")
                self.reHash()
                index = self.quadraticFunction(data,0)
                countCollision = 0
                old_index = index
                
            else:
                index = self.quadraticFunction(old_index, countCollision)

        return index
    
    def quadraticFunction(self, old_index, n):
        return (old_index + n**2) % self.tableSize

    def reHash(self):
        # Set Old Table to None
        for item in self.table:
            item = None

        # Find new TableSize
        newTableSize = self.tableSize*2
        while not self.isPrime(newTableSize):
        
            newTableSize += 1

        # Create new Table with append None
        for i in range(self.tableSize, newTableSize):
            self.table.append(None)
        self.tableSize = newTableSize

        # Re-hashing old data to new Table with addOrder
        for data in self.addOrder:
            index = self.hashing(data)
            self.table[index] = data

    def isPrime(self, num):
        for i in range(2, int(num**0.5)+1):
            if num % i == 0:
                return False

        return True

    def printHashTable(self):

        for i in range(self.tableSize):
            print("#{}\t{}".format(i+1, self.table[i]))

        print("----------------------------------------")
    
### Main ###
print(" ***** Rehashing *****")
inp = input("Enter Input : ").split('/')

tableSize, maxCollision, threshold = list(map(int, inp[0].split()))
dataList = list(map(int, inp[1].split()))

hash = Hash(tableSize, maxCollision, threshold)
for data in dataList:
    hash.addData(data)
