dataComparison = 0

### Function ###
def mergeSort(sequence):
    global dataComparison

    if len(sequence) <= 1:
        return sequence
    
    center = len(sequence)//2

    leftSequence = sequence[0:center]
    rightSequence = sequence[center:]

    leftSequence = mergeSort(leftSequence)
    rightSequence = mergeSort(rightSequence)

    newSequence = []
    i,j = 0,0
    while i<len(leftSequence) and j<len(rightSequence):
        dataComparison+=1
        if leftSequence[i] <= rightSequence[j]:
            newSequence.append(leftSequence[i])
            i+=1
        else:
            newSequence.append(rightSequence[j])
            j+=1
    
    while i<len(leftSequence):
        newSequence.append(leftSequence[i])
        i+=1
    
    while j<len(rightSequence):
        newSequence.append(rightSequence[j])
        j+=1

    return newSequence

### Main ###
print(" *** Merge sort ***")
inp = input("Enter some numbers : ").split()

sequence = list(map(int,inp))
print()
sequence = mergeSort(sequence)
print("Sorted ->",*sequence)
print("Data comparison =  {}".format(dataComparison))