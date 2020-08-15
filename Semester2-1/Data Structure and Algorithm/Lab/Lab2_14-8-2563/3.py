### Function ###
def odd_even(dataList, selection):
    if selection == "Odd":
        return dataList[0::2]

    elif selection == "Even":
        return dataList[1::2]

### Main ###
print("*** Odd Even ***")
dataType, inputData, option = input("Enter Input : ").split(',')

if dataType == 'S':
    print(odd_even(inputData,option))
elif dataType == 'L':
    print(odd_even(list(inputData.split()),option))
