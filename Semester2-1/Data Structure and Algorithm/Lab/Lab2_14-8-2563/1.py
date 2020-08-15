### Function ###
def mapping(inputList):
    returnDict = {}
    value = 0
    for key in inputList:
        if returnDict.get(key) == None:
            returnDict[key] = value
            value += 1
          
    return returnDict

### Main ###
inputTextList = list(input("Enter String : "))
inputDict = mapping(inputTextList)
result = []

for key in inputTextList:
    result.append(inputDict.get(key))

print(result)





