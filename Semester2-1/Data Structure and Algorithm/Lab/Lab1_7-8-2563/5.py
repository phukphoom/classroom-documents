### Main ###
num = int(input("Enter Input : "))

# >Pattern 1
for i in range(num+1):
    for x in range((num+2)-(i+1)):
        print(".",end='')
    for y in range((i+1)):
        print("#",end='')

    if(i==0):
        for k in range(num+2):
            print("+", end='')
    else:
        print("+", end='')
        for k in range(num):
            print("#", end='')
        print("+", end='')

    print();

# >Pattern 2
for i in range(2):
    for x in range(num+2):
        print("#", end='')
    for y in range(num+2):
        print("+", end='')

    print()

# >Pattern 3
for i in range(num,-1,-1):
    if(i==0):
        for k in range(num+2):
            print("#", end='')
    else:
        print("#", end='')
        for k in range(num):
            print("+", end='')
        print("#", end='')

    for x in range((i+1)):
        print("+",end='')
    for y in range((num+2)-(i+1)):
        print(".",end='')

    print();
