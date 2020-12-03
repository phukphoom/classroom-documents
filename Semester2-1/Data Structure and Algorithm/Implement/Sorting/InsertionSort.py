### Function ###
def InsertionSort(sequence):
    for i in range(1,len(sequence)):
        insertElement = sequence[i]
        for j in range(i,-1,-1):
            if insertElement < sequence[j-1] and j>0:
                sequence[j],sequence[j-1] = sequence[j-1],sequence[j]
            else:
                break

    return sequence
    
### Example ###]
example = [2,3,4,5,7,1,2,4]
print("Before Sorting\t:",example)

example = InsertionSort(example)
print("After Sorting\t:",example)