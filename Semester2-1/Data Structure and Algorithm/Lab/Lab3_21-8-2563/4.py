### Function ###
def rotateA(string):
    returnFrontString = string[-2::]
    returnBackString = string[0:-2:]
    return returnFrontString + returnBackString

def rotateB(string):
    returnFrontString = string[3::]
    returnBackString = string[0:3:]
    return returnFrontString + returnBackString

### Main ###
print("*** String Rotation ***")
stringA,stringB = input("Enter 2 strings : ").split()

count = 1
defaultStringA = stringA
defaultStringB = stringB
while rotateA(stringA)!=defaultStringA or rotateB(stringB)!=defaultStringB:
    stringA = rotateA(stringA)
    stringB = rotateB(stringB)
    if count<=5:
        print('{} {} {}'.format(count,stringA,stringB))
    count+=1
else:
    if count>5:
        print(" . . . . .")
        
    stringA = rotateA(stringA)
    stringB = rotateB(stringB)
    print('{} {} {}'.format(count,stringA,stringB))
    print("Total of  {} rounds.".format(count))