### Function ###
def staircase(row,num_stair):
    if num_stair == 0:
        print("Not Draw!")
        return

    if row == 0:
        return

    if row>0:
        printUnderScore(row-1)
        printShape(num_stair-(row-1))
        print()
        staircase(row-1,num_stair)
    if row<0:
        printUnderScore(num_stair+row)
        printShape(num_stair-(num_stair+row))
       
        print()

        staircase(row+1,num_stair)
    
def printShape(n):
    if n == 0:
        return
    print('#',end='')
    printShape(n-1)

def printUnderScore(n):
    if n == 0:
        return
    print('_',end='')
    printUnderScore(n-1)

### Main ###
numInput = int(input("Enter Input : "))
staircase(numInput,abs(numInput))