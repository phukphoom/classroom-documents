### Function ###
def boubleSort(sequence, pass_num=None):
    if pass_num is None:
        pass_num = len(sequence)-1

    if pass_num == 0:
        return

    processInPass(sequence, pass_num)
    boubleSort(sequence, pass_num-1)

def processInPass(sequence, pass_num, index=0):
    if index == pass_num:
        return

    if sequence[index] > sequence[index+1]:
        sequence[index], sequence[index + 1] = sequence[index+1], sequence[index]

    if index < len(sequence):
        processInPass(sequence, pass_num, index+1)

### Main ###
inputList = list(map(int, input("Enter Input : ").split()))
boubleSort(inputList)
print(inputList)
