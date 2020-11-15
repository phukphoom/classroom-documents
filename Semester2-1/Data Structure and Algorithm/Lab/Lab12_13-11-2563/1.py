### Function ###
def bi_search(left_index, right_index, arr, value):
 
    if left_index > right_index:
        return False

    center_index = (left_index+right_index)//2

    if value < arr[center_index]:
        return bi_search(left_index, center_index-1, arr, value)
    elif value > arr[center_index]:
        return bi_search(center_index+1, right_index, arr, value)
    else:
        return True

### Main ###
inp = input('Enter Input : ').split('/')
arr, k = list(map(int, inp[0].split())), int(inp[1])
print(bi_search(0, len(arr) - 1, sorted(arr), k))
