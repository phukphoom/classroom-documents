### function ###
def printGrid(grid):
    print('\n\n', end='')
    for row in grid:
        print(row)

def fineMine(grid):
    for i in range(len(grid)):
        for j in range(len(grid[i])):

            if(grid[i][j] == '#'):
                for x in range(-1, 2):
                    for y in range(-1, 2):
                        if(grid[i+x][j+y] != '#' and i+x >= 0 and i+x < len(grid) and j+y >= 0 and j+y < len(grid[i])):
                            if(grid[i+x][j+y] == '-'):
                                grid[i+x][j+y] = '1'
                            else:
                                grid[i+x][j+y] = int(grid[i+x][j+y])
                                grid[i+x][j+y] += 1
                                grid[i+x][j+y] = str(grid[i+x][j+y])

            elif(grid[i][j] == '-'):
                grid[i][j] = '0'

    return grid

### Main ###
print("*** Minesweeper ***")
input_list = input("Enter input(5x5) : ").split(',')
grid = []
for item in input_list:
    grid.append(item.split(' '))

printGrid(grid)
printGrid(fineMine(grid))
