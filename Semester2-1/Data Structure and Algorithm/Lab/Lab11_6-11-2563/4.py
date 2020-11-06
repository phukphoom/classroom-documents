### Function ###
def boubleSort(sequence):
    for i in range(len(sequence)-1):
        swaped = False

        for j in range(len(sequence)-1-i):
            if sequence[j] > sequence[j+1]:
                swaped = True
                sequence[j],sequence[j+1] = sequence[j+1],sequence[j]
                
        if not swaped :
            break
    return sequence

### Main###
inputList = input("Enter Input : ").split()
alphaDict = dict()
for inp in inputList:
    for char in list(map(chr,range(ord('a'),ord('z')+1))):
        if inp.find(char) !=- 1:
            alphaDict[char] = inp
            break

alphaDictKeySequence = list(alphaDict.keys())
boubleSort(alphaDictKeySequence)
for key in alphaDictKeySequence:
    print(alphaDict[key],end=' ')

