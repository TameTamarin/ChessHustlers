-- Initalize the variables for all of the board spaces

SPACESIZE = 0
BOARDHEIGHT = 0
BOARDWIDTH = 0

------------------------------------
-- Functions for settibg board
-- dimensions
------------------------------------
function setSpaceSize(spaceSize)
    SPACESIZE = spaceSize
end

function setBoardPosition(xStartPos, yStartPos)
    XSTARTPOS = xStartPos
    YSTARTPOS = yStartPos
end

function setBoardSpaceDimensions(heightSpaces, widthSpaces)
    BOARDHEIGHT = heightSpaces
    BOARDWIDTH  = widthSpaces
end

------------------------------------
-- Funtion for initalizing the board
------------------------------------

function initBoardState()
    -- Initiate the boardstate as a blank table
    boardState = {}
    x = 0 + XSTARTPOS
    
    -- iterate through each space based on the size of the board
    for i = 1, BOARDWIDTH do
        boardState[i] = {}
        -- y position has to be reinitallized for each index of the x position so we start from top
        y = 0 + YSTARTPOS
        for j = 1, BOARDHEIGHT do
            -- set all the attributes for each space
            boardState[i][j] = {
            ["xpos"] = 0,
            ["ypos"] = 0,
            ["visible"] = true,
            ["piece"] = "none",
            ["upgrade"] = "none",
            ["pieceColor"] = "white",
            ["fwdMoveAmt"] = 0,
            ["RevMoveAmt"] = 0,
            ["RgtMoveAmt"] = 0,
            ["LftMoveAmt"] = 0
            }
            -- set each x and y position of the currently indexed space
            boardState[i][j]["xpos"] = x
            boardState[i][j]["ypos"] = y
            y = y + SPACESIZE
        end

        -- Increment the x pos after setting each paramater
        x = x + SPACESIZE

    end
end


function getBoardState()
    return boardState
end

function updateBoardSpaceAttr(row, col, attr, val)
    boardState[row][col][attr] = val
end

-----------------------------------
-- Function to draw the chess board
-----------------------------------
function drawBoard(boardStartPos, boardSize)
    love.graphics.rectangle("line", boardStartPos[1], boardStartPos[2], boardSize, boardSize)
    colorIndex = 1
    for i = 1, #boardState do
        for j = 1, #boardState[i] do
            if colorIndex%2 == 0 then
                love.graphics.setColor(0,0,1)
            else
                love.graphics.setColor(0,1,0)
            end
            colorIndex = colorIndex + 1
            love.graphics.rectangle( "fill", boardState[i][j]["xpos"], boardState[i][j]["ypos"], SPACESIZE, SPACESIZE)
        end
        colorIndex = colorIndex + 1
    end
end



function drawBoardOld(boardStartPos, boardSize)
    -- love.graphics.setColor(1,0,0)
    love.graphics.rectangle("line", boardStartPos[1], boardStartPos[2], boardSize, boardSize)
    for row = 0, 7 do
        for loopIndex = 0, 3 do
            if row % 2 == 0 then
                love.graphics.rectangle( "fill", boardStartPos[1]+ (loopIndex*2+1)*SPACESIZE, boardStartPos[2]+ row*SPACESIZE, SPACESIZE, SPACESIZE)
            else
                love.graphics.rectangle( "fill", boardStartPos[1]+ loopIndex*2*SPACESIZE, boardStartPos[2]+ row*SPACESIZE, SPACESIZE, SPACESIZE)
                
            end
        end
    end
end

