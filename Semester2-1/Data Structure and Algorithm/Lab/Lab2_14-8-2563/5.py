### Class ###
class TorKhamGame:
    def __init__(self):
        self.wordList = []
        self.endGame = False

    def getRecentWord(self):
        if self.wordList:
            return self.wordList[len(self.wordList)-1]

    def getLowerWordList(self):
        returnBuffer = [];
        for word in self.wordList:
            returnBuffer.append(word.lower())
        return returnBuffer

    def run(self, commandList):
        for command in commandList:
            # >> End this game
            if self.endGame:
                break

            # >> Run this game command
            option = command.split()[0]
            if option == 'P':
                word = command.split()[1]
                if not self.wordList:
                    self.wordList.append(word)
                    print("'{}' -> {}".format(word, self.wordList))
                else:
                    if not word.lower() in self.getLowerWordList() and self.getRecentWord()[-2::].lower() == word[0:2:].lower():
                        self.wordList.append(word)
                        print("'{}' -> {}".format(word, self.wordList))
                    else:
                        print("'{}' -> game over".format(word))
                        self.endGame = True

            elif option == 'R':
                print("game restarted")
                self.wordList.clear()

            elif option == 'X':
                self.endGame = True

            else:
                print("'{}' is Invalid Input !!!".format(command))
                self.endGame = True

### Main ###
print("*** TorKham HanSaa ***")
commandList = input("Enter Input : ").split(',')
game = TorKhamGame()
game.run(commandList)
