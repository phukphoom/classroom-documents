### Function ###
def selectionSort(sequence, pass_num=None):
    if pass_num is None:
        pass_num = len(sequence)-1

    if pass_num == 0:
        return

    processInPass(sequence, pass_num)
    selectionSort(sequence, pass_num-1)

def processInPass(sequence, pass_num, maxValue_index=0, index=0):
    if index == pass_num + 1:
        if maxValue_index != pass_num:
            sequence[pass_num], sequence[maxValue_index] = sequence[maxValue_index], sequence[pass_num]
            print(
                "swap {} <-> {} : {}".format(sequence[maxValue_index], sequence[pass_num], sequence))
        return

    if sequence[maxValue_index] < sequence[index]:
        maxValue_index = index

    if index < len(sequence):
        processInPass(sequence, pass_num, maxValue_index, index+1)

### Main ###
inputList = list(map(int, input("Enter Input : ").split()))
selectionSort(inputList)
print(inputList)
