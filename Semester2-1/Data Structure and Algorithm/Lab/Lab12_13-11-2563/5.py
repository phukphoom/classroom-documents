### Function ###
def minimumWeight(weight_list,num_box):
    if num_box <= 1 or len(weight_list)<=1:
        return sum(weight_list)

    else:
        minValue = 999999999
        for i in range(len(weight_list)-1,0,-1):
            leftSequence = weight_list[:i]
            rightSequence = weight_list[i:]

            temp = max(minimumWeight(leftSequence,1),minimumWeight(rightSequence,num_box-1))
            
            minValue = min(temp,minValue)
            
    return minValue
    
### Main ###
weightList, numBox = input("Enter Input : ").split('/')
weightList = list(map(int, weightList.split()))
numBox = int(numBox)

print("Minimum weigth for {} box(es) = {}".format(numBox,minimumWeight(weightList,numBox)))
