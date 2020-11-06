### Function ###
def boubleSort(sequence):
    for i in range(len(sequence)-1):
        swaped = False

        for j in range(len(sequence)-1-i):
            if sequence[j] > sequence[j+1]:
                swaped = True
                sequence[j], sequence[j+1] = sequence[j+1], sequence[j]

        if not swaped:
            break
    return sequence

def getPatternStorage(sequence, summation, curr_summation=0, index=0, pattern=None, patternStorage=None):
    if pattern is None:
        pattern = []
    if patternStorage is None:
        patternStorage = []

    if curr_summation == summation:
        patternStorage.append(list(pattern))
        return patternStorage

    if index == len(sequence):
        return patternStorage

    pattern.append(sequence[index])
    getPatternStorage(sequence, summation, curr_summation + sequence[index], index+1, pattern, patternStorage)

    pattern.pop()
    getPatternStorage(sequence, summation, curr_summation, index+1, pattern, patternStorage)

    return patternStorage

def sortPatterStorage(patternStorage):
    for i in range(len(patternStorage)-1):
        swaped = False

        for j in range(len(patternStorage)-1-i):
            if len(patternStorage[j]) > len(patternStorage[j+1]):
                swaped = True
                patternStorage[j], patternStorage[j+1] = patternStorage[j+1], patternStorage[j]
        if not swaped:
            break
    return patternStorage

### Main ###
summation, inputList = input('Enter Input : ').split('/')
summation = int(summation)
inputList = list(map(int, inputList.split()))

boubleSort(inputList)
patternStorage = getPatternStorage(inputList, summation)
sortPatterStorage(patternStorage)
if len(patternStorage) == 0:
    print("No Subset")
else:
    for pattern in patternStorage:
        print(pattern)
