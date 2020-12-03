### Function ###
def boubleSort(sequence):
    dataComparison = 0
    for i in range(len(sequence)-1):
        swaped = False
        for j in range(len(sequence)-1-i):
            dataComparison += 1
            if sequence[j] > sequence[j+1]:
                sequence[j],sequence[j+1] = sequence[j+1],sequence[j]
                swaped = True
                
        if not swaped:
            break
    
    return sequence,dataComparison

## Main ###
print(" *** Bubble sort ***")
inp = input("Enter some numbers : ").split()

sequence = list(map(int,inp))
print()
sequence,dataComparison = boubleSort(sequence)
print(sequence)
print("Data comparison =",dataComparison)