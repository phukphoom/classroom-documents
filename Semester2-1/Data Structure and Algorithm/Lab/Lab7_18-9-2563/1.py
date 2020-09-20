### Function ###
def fibonacci(n):
    if n == 0:
        return 0

    if n == 1:
        return 1

    return fibonacci(n-1) + fibonacci(n-2)

### Main ###
numInput = int(input("Enter Number : "))
print("fibo({}) = {}".format(numInput,fibonacci(numInput)))