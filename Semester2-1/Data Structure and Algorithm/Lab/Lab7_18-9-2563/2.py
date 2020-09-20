### Function ###
def checkPalindome(string, head_index, tail_index) : 
    if string[head_index] != string[tail_index] : 
        return False
    else:
        return True

    if head_index < tail_index  : 
        return checkPalindome(string, head_index + 1, tail_index - 1); 

### Main ###
textInput = input("Enter Input : ")
if checkPalindome(textInput,0,len(textInput)-1):
    print("'{}' is palindrome".format(textInput))
else:
    print("'{}' is not palindrome".format(textInput))