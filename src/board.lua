-----------------------------------
-- Data structure for holding
-- the board state and pieces.
-- Each element in the array consists
-- of: location, piece, upgrade,
-- movement amount, move
-----------------------------------

-- Initalize the variables for all of the board spaces

spaceAttr = {["xpos"] = 0, ["ypos"] = 0, ["visible"] = true, ["piece"] = "none", ["upgrade"] = "none", ["color"] = "white", ["fwdMoveAmt"] = 0, ["RevMoveAmt"] = 0,
                    ["RgtMoveAmt"] = 0, ["LftMoveAmt"] = 0}

-- a1, b1, c1, d1, e1, f1, g1, h1 = spaceAttr, spaceAttr, spaceAttr, spaceAttr, spaceAttr, spaceAttr, spaceAttr, spaceAttr
-- a2, b2, c2, d2, e2, f2, g2, h2 = spaceAttr, spaceAttr, spaceAttr, spaceAttr, spaceAttr, spaceAttr, spaceAttr, spaceAttr
-- a3, b3, c3, d3, e3, f3, g3, h3 = spaceAttr, spaceAttr, spaceAttr, spaceAttr, spaceAttr, spaceAttr, spaceAttr, spaceAttr
-- a4, b4, c4, d4, e4, f4, g4, h4 = spaceAttr, spaceAttr, spaceAttr, spaceAttr, spaceAttr, spaceAttr, spaceAttr, spaceAttr
-- a5, b5, c5, d5, e5, f5, g5, h5 = spaceAttr, spaceAttr, spaceAttr, spaceAttr, spaceAttr, spaceAttr, spaceAttr, spaceAttr
-- a6, b6, c6, d6, e6, f6, g6, h6 = spaceAttr, spaceAttr, spaceAttr, spaceAttr, spaceAttr, spaceAttr, spaceAttr, spaceAttr
-- a7, b7, c7, d7, e7, f7, g7, h7 = spaceAttr, spaceAttr, spaceAttr, spaceAttr, spaceAttr, spaceAttr, spaceAttr, spaceAttr
-- a8, b8, c8, d8, e8, f8, g8, h8 = spaceAttr, spaceAttr, spaceAttr, spaceAttr, spaceAttr, spaceAttr, spaceAttr, spaceAttr

-- boardSpaces = {a1, b1, c1, d1, e1, f1, g1, h1, 
--             a2, b2, c2, d2, e2, f2, g2, h2, 
--             a3, b3, c3, d3, e3, f3, g3, h3, 
--             a4, b4, c4, d4, e4, f4, g4, h4,
--             a5, b5, c5, d5, e5, f5, g5, h5,
--             a6, b6, c6, d6, e6, f6, g6, h6,
--             a7, b7, c7, d7, e7, f7, g7, h7,
--             a8, b8, c8, d8, e8, f8, g8, h8}
            
boardState = {}
function initBoardState(boardWidth, boardHeight)
    for i = 1, boardWidth do
        boardState[i] = {}
        for j = 1, boardHeight do
            boardState[i][j] = spaceAttr
        end
    end
    print(#boardState)
end


function getBoardState()
    return boardState
end

function updateBoardSpaceAttr(row, col, attr, val)
    boardState[row][col][attr] = val
end

function updateBoardSpace(space, attrSet)
    boardState[space] = attrSet
end

-----------------------------------
-- Function to draw the chess board
-----------------------------------
function drawBoard(boardStartPos, boardSize, spaceSize)
    love.graphics.rectangle("line", boardStartPos[1], boardStartPos[2], boardSize, boardSize)
    for row = 0, 7 do
        for loopIndex = 0, 3 do
            if row % 2 == 0 then
                love.graphics.rectangle( "fill", boardStartPos[1]+ (loopIndex*2+1)*spaceSize, boardStartPos[2]+ row*spaceSize, spaceSize, spaceSize)
            else
                love.graphics.rectangle( "fill", boardStartPos[1]+ loopIndex*2*spaceSize, boardStartPos[2]+ row*spaceSize, spaceSize, spaceSize)
                
            end
    
        end

    end
end

