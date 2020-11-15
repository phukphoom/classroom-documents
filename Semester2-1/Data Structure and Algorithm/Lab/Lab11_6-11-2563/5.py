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

def getPatternStorage(sequence, summation, curr_summation=0, index=0, pattern=None, pattern_storage=None):
    if pattern is None:
        pattern = []
    if pattern_storage is None:
        pattern_storage = []

    if curr_summation == summation:
        pattern_storage.append(list(pattern))
        return pattern_storage

    if index == len(sequence):
        return pattern_storage

    pattern.append(sequence[index])
    getPatternStorage(sequence, summation, curr_summation + sequence[index], index+1, pattern, pattern_storage)

    pattern.pop()
    getPatternStorage(sequence, summation, curr_summation, index+1, pattern, pattern_storage)

    return pattern_storage

def sortPatterStorage(pattern_storage):
    for i in range(len(pattern_storage)-1):
        swaped = False

        for j in range(len(pattern_storage)-1-i):
            if len(pattern_storage[j]) > len(pattern_storage[j+1]):
                swaped = True
                pattern_storage[j], pattern_storage[j+1] = pattern_storage[j+1], pattern_storage[j]
        if not swaped:
            break
    return pattern_storage

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
