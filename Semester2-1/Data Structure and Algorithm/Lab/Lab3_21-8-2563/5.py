### Class ###
class MyInt:
    def __init__(self,num):
        self.num = num

    def __sub__(self,other):
        return self.num-(int(other.num/2))

    def isPrime(self):
        count = 0
        for i in range(1,self.num):
            if(self.num%i==0):
                count+=1

        if(count==1):
            return True
        return False

    def showPrime(self):
        primeListBuffer = []
        for i in range(2,self.num+1):
            checkNum = MyInt(i)
            if(checkNum.isPrime()):
                primeListBuffer.append(str(checkNum.num))

        if(self.num>1):
            return ' '.join(primeListBuffer)
        else:
            return "!!!A prime number is a natural number greater than 1"
    

### Main ###
print(" *** class MyInt ***")
a,b = list(map(int,input("Enter 2 number : ").split()))

a = MyInt(a)
b = MyInt(b)
print("{} isPrime : {}".format(a.num,a.isPrime()))
print("{} isPrime : {}".format(b.num,b.isPrime()))

print("Prime number between {} and {} : {}".format(2,a.num,a.showPrime()))
print("Prime number between {} and {} : {}".format(2,b.num,b.showPrime()))
print("{} - {} = {}".format(a.num,b.num,a-b))