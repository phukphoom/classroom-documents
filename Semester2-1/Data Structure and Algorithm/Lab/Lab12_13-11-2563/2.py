### Function ###
def firstGreaterValue(sorted_arr,value):
    
    for i in range(len(sorted_arr)):
        if sorted_arr[i] > value:
            return  sorted_arr[i]
    
    return "No First Greater Value"


### Main ###
leftList,rightList = input("Enter Input : ").split('/')
leftList = list(map(int,leftList.split()))
rightList = list(map(int,rightList.split()))

for item in rightList:
    print(firstGreaterValue(sorted(leftList),item))