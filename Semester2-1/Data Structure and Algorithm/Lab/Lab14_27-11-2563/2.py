### Function ###
def insertionSort(sequence):
    dataComparison = 0
    for i in range(1,len(sequence)):
        insertElement = sequence[i]
        for j in range(i,-1,-1):
            if j == 0:
                break
            dataComparison += 1
            if insertElement < sequence[j-1] and j>0:
                sequence[j-1],sequence[j] = sequence[j],sequence[j-1]
            else:
                break
        
    return sequence,dataComparison

### Main ###
print(" *** Insertion sort ***")
inp = input("Enter some numbers : ").split()

sequence = list(map(int,inp))
print()
sequence,dataComparison = insertionSort(sequence)
print(sequence)
print("Data comparison = ",dataComparison)