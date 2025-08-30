board = require('board')


-- state = {}
setSpaceSize(100)
setBoardSpaceDimensions(8,8)
state = initBoardState()

-- print(state["a1"]["piece"])
-- print(boardState[a1])
-- for i = 1, #boardState do
    -- print(i)
    --     for j = 1, #boardState[i] do
    --         print(boardState[i][j]["xpos"])
    --         print(boardState[i][j]["ypos"])
    --         print(j)
    --     end
    -- end
print(#boardState)
print(#boardState[2])
print(boardState[2][6]["xpos"])
print(boardState[4][5]["ypos"])

