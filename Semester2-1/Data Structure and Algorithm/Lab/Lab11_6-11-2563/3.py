### Function ###
def insertionSort(sequence, index=1):
    if index == len(sequence):
        print('sorted')
        return

    insertLeft(sequence, index)

    if len(sequence[0:index+1]) != 0:
        print(sequence[0:index+1], end=' ')
    if len(sequence[index+1:]) != 0:
        print(sequence[index+1:], end=' ')
    print()

    insertionSort(sequence, index+1)

def insertLeft(sequence, index):
    if index-1 < 0:
        print("insert {} at index {} : ".format(
            sequence[index], index), end='')
        return

    if sequence[index-1] > sequence[index]:
        sequence[index], sequence[index-1] = sequence[index-1], sequence[index]
        insertLeft(sequence, index-1)
    else:
        print("insert {} at index {} : ".format(
            sequence[index], index), end='')

### Main ###
inputList = list(map(int, input("Enter Input : ").split()))
insertionSort(inputList)
print(inputList)
