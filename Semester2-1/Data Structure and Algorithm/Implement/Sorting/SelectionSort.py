### Function ###
def SelectionSort(sequence):
    for i in range(len(sequence)):
        minIndex = i
        
        for j in range(i,len(sequence)):
            if sequence[minIndex] > sequence[j]:
                minIndex = j

        sequence[i],sequence[minIndex] = sequence[minIndex],sequence[i]
    return sequence
    
### Example ###]
example = [2,3,4,5,7,1,2,4]
print("Before Sorting\t:",example)

example = SelectionSort(example)
print("After Sorting\t:",example)