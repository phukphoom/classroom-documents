### Function ###
def BoubleSort(sequence):
    for i in range(len(sequence)-1):
        swaped = False

        for j in range(len(sequence)-1-i):
            if sequence[j] > sequence[j+1]:
                swaped = True
                sequence[j],sequence[j+1] = sequence[j+1],sequence[j]
                
        if not swaped :
            break
    return sequence
    
### Example ###]
example = [2,3,4,5,7,1,2,4]
print("Before Sorting\t:",example)

example = BoubleSort(example)
print("After Sorting\t:",example)