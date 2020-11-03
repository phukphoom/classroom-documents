### Class ###
class HaffmanNode:
    def __init__(self, char, freq, left=None, right=None):
        self.char = char
        self.freq = freq
        self.left = left
        self.right = right

class HaffmanTree:
    def __init__(self, text):
        self.text = text
        self.charFreq = self.mapCharFreq(self.text)

        self.root = self.generateTree()

        self.code = dict()
        self.generateCode(self.root,[])

    def mapCharFreq(self, text):
        charFreq = dict()
        for char in text:
            if char not in charFreq.keys():
                charFreq[char] = 1
            else:
                charFreq[char] += 1

        return charFreq

    def generateCode(self,root,code):
        if root.char != '*':
            self.code[root.char] = "".join(code)
            return
        
        code.append('1')
        self.generateCode(root.right,code)
        code.pop()

        code.append('0')
        self.generateCode(root.left,code)
        code.pop()
    
    def generateTree(self):
        slot = []
        for key in self.charFreq.keys():
            slot.append(HaffmanNode(key, self.charFreq[key]))
        slot.sort(key=lambda node: ord(node.char) + 62 if node.char == ' ' else ord(node.char))
        slot.sort(key=lambda node: node.freq)
        while len(slot) > 1:
            sumFreq = slot[0].freq + slot[1].freq

            if slot[0].freq <= slot[1].freq:
                slot.append(HaffmanNode('*', sumFreq, slot[0], slot[1]))
            else:
                slot.append(HaffmanNode('*', sumFreq, slot[1], slot[0]))
            slot.pop(0)
            slot.pop(0)
            slot.sort(key=lambda node: ord(node.char) + 62 if node.char == ' ' else ord(node.char))
            slot.sort(key=lambda node: node.freq)

        return slot[0]

    def printTree(self, node, level=0):
        if node is not None:
            self.printTree(node.right, level + 1)
            # print("{}({}){}".format('     ' * level,node.freq,node.char))
            print('     ' * level, node.char)
            self.printTree(node.left, level + 1)


### Main ###
inputText = input('Enter Input : ')
tree = HaffmanTree(inputText)

print(tree.code)
tree.printTree(tree.root)
print("Encoded! : ",end='')
for char in inputText:
    print(tree.code[char],end='')
