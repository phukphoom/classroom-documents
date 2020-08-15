### Main ###
inputList = list(map(int, input("Enter Your List : ").split()))
inputList.sort()

if len(inputList) < 3:
    print("Array Input Length Must More Than 2")
else:
    # >> Algorithm with Combination
    result = []
    for i in range(0, len(inputList)-2):
        for j in range(i+1, len(inputList)-1):
            for k in range(j+1, len(inputList)):
                if(inputList[i]+inputList[j]+inputList[k] == 0 and [inputList[i], inputList[j], inputList[k]] not in result):
                    result.append([inputList[i], inputList[j], inputList[k]])
    print(result)
