### Function ###
def checkPalindome(string, head_index, tail_index):
    if string[head_index] != string[tail_index]:
        return False

    if head_index < tail_index:
        return checkPalindome(string, head_index + 1, tail_index - 1)

    return True

### Main ###
textInput = input("Enter Input : ")
if checkPalindome(textInput, 0, len(textInput)-1):
    print("'{}' is palindrome".format(textInput))
else:
    print("'{}' is not palindrome".format(textInput))