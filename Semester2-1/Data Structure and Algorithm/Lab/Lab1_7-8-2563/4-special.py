### Main ###
print("*** Fun with Drawing ***")
num = int(input("Enter input : "))

#> Pattern 1
for i in range(2*num-2):
    for j in range(i):
        if(j%2==0):
            print('#',end='')
        else:
            print('.',end='')

    if(i%2==0):
        for j in range((4*num-3)-(2*i)):
            print('#',end='')
    else:
        for j in range((4*num-3)-(2*i)):
            print('.',end='')

    for j in range(i-1,-1,-1):
        if(j%2==0):
            print('#',end='')
        else:
            print('.',end='')

    print()

#> Pattern 2
for i in range(4*num-3):
    if(i%2==0):
        print('#',end='')
    else:
        print('.',end='')

print()

#> Pattern 3
for i in range(2*num-2-1,-1,-1):
    for j in range(i):
        if(j%2==0):
            print('#',end='')
        else:
            print('.',end='')

    if(i%2==0):
        for j in range((4*num-3)-(2*i)):
            print('#',end='')
    else:
        for j in range((4*num-3)-(2*i)):
            print('.',end='')

    for j in range(i-1,-1,-1):
        if(j%2==0):
            print('#',end='')
        else:
            print('.',end='')

    print()
