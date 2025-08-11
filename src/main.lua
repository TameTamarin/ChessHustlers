
---------------------------------
-- Load Function callback
---------------------------------
function love.load()
    -- load in submodules
    timing = require('timing')
    keyCommands = require('keyCommands')
    cursor = require('cursor')
    board = require('board')
    
    -- Setup GLobal variables
    timeStart = love.timer.getTime()
    x = 0
    FPSCAP = 60
    DT = 1/1000 --miliseconds
    WINDOWX = 1000
    WINDOWY = 900
    BOARDSIZE = 600
    SPACESIZE = BOARDSIZE/8
    BOARDSTARTPOS = {WINDOWX/2 - BOARDSIZE/2, WINDOWY/2 - BOARDSIZE/2}
    success = love.window.setMode(WINDOWX, WINDOWY)
    canvas = love.graphics.newCanvas(WINDOWX, WINDOWY)
    background = love.graphics.newImage('/Images/Backgrounds/VintageChessBoard.png')
    boardBackground = love.graphics.rectangle("fill", BOARDSTARTPOS[1], BOARDSTARTPOS[2], BOARDSIZE, BOARDSIZE)
    
    -- Setup Canvas for drawing background and the board
    love.graphics.setCanvas(canvas)
        love.graphics.clear(0, 0, 0, 0)
        love.graphics.setBlendMode("alpha")
        --love.graphics.draw(background, 0,0)
        drawBoard(BOARDSTARTPOS, BOARDSIZE, SPACESIZE)
        love.graphics.setCanvas()
    king = love.graphics.newImage('/Images/ChessPieces/KingPiece.png')
end


---------------------------------
-- Update Function callback
---------------------------------
function love.update()
    -- Control frame rate
    sleep(DT, FPSCAP)
    
    cursorX, cursorY = getCursorPosition()
    
    CIRCLECOORDS = moveCircle(CIRCLECOORDS, CIRCLESPEED)
    click = checkMouseClick()
    if click then
        if (CIRCLECOORDS[1] - 10 <= cursorX) and (CIRCLECOORDS[1] + 10 >= cursorX) and (CIRCLECOORDS[2] - 10 <= cursorY) and (CIRCLECOORDS[2] + 10 >= cursorY) then
        CIRCLECOORDS[1] = math.random(10, 400)
        CIRCLECOORDS[2] = math.random(10, 400)
        end
    end
end


---------------------------------
-- Draw Function callback
---------------------------------
function love.draw()
    love.graphics.draw(canvas, 0,0)
    love.graphics.print("Cursor Position ..." .. tostring(cursorX)..", "..tostring(cursorY), 40, 300)
    love.graphics.print("Click the dot ...", 40, 400)
    --love.graphics.rectangle( "fill", CIRCLECOORDS[1], CIRCLECOORDS[2], SPACESIZE, SPACESIZE)
    --love.graphics.draw(king, 0,0)

    love.graphics.print("Current elapsed game time ..." .. tostring(elapsedTime()), 40, 100)
    love.graphics.print("Mouse clicked ..." .. tostring(click), 40, 350)
end