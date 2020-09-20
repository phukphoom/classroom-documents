### Function ###
def printBin(num,max_digit):
    if max_digit == 1:
        print(num%2,end='')     
        return

    printBin(num//2,max_digit-1)
    print(num%2,end='')

def printBinInRange(last_num,max_digit):
    if last_num < 0:
        return

    printBinInRange(last_num-1,max_digit)
    printBin(last_num,max_digit)
    print()

### Main ###
numInput = int(input("Enter Number : "))
if numInput == 0:
    print(0)
elif numInput > 0:
    printBinInRange((2**numInput)-1,numInput)
else:
    print("Only Positive & Zero Number ! ! !")