### Function ###
def getFactor(num):
    listBuffer = []
    for i in range(1,int(num**(1/2))+1):
        if num%i==0:
            listBuffer.append(i)
            listBuffer.append(num//i)
    setBuffer = set(listBuffer)

    returnBuffer = list(setBuffer)
    returnBuffer.sort()
    return returnBuffer

def checkPerfect(num,factorList):
    factorList.remove(num)

    total = 0
    for item in factorList:
        total += item

    if total==num:
        print(num,"is a PERFECT NUMBER.")
    else:
        print(num,"is NOT a perfect number.")
    print("Factors :" ,factorList)

### Main ###
print(" *** Perfect Number Verification ***")
num = int(input("Enter number : "))
if num > 0:
    numFactor = getFactor(num)
    checkPerfect(num,numFactor)
else:
    print("Only positive number !!!")