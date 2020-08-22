### Main ###
textInput = input("Enter number end with (-1) : ").split("-1")

if len(textInput)<2:
    print("Invalid INPUT !!!")
else:
 
    dataList = list(map(int,textInput[0].split()))
    countDict = {}
    for item in dataList:
        pass
        if item not in countDict.keys():
            countDict[item] = 1
        else:
            countDict[item] += 1 
    
    if(len(dataList)!=0):
        if(max(countDict.values())>len(dataList)//2):
            for key in countDict.keys():
                if countDict[key]==max(countDict.values()):
                    print(key)
        else:
            print("Not found")
    else:
        print("Not found")