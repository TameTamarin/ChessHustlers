function love.load()
    -- load in submodules
    timing = require('timing')
    keyCommands = require('keyCommands')
    cursor = require('cursor')
    
    -- Setup GLobal variables
    timeStart = love.timer.getTime()
    x = 0
    FPSCAP = 60
    DT = 1/1000 --miliseconds
    CIRCLECOORDS = {100,100}
    CIRCLESIZE = 3
    CIRCLESPEED = 5
    WINDOWX = 800
    WINDOWY = 400
end

function love.resize(WINDOWX, WINDOWY)
end


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


function love.draw()
    love.graphics.print("Cursor Position ..." .. tostring(cursorX)..", "..tostring(cursorY), 40, 300)
    love.graphics.print("Click the dot ...", 40, 400)
    love.graphics.circle( "fill", CIRCLECOORDS[1], CIRCLECOORDS[2], CIRCLESIZE)

    love.graphics.print("Current elapsed game time ..." .. tostring(elapsedTime()), 40, 100)
    love.graphics.print("Mouse clicked ..." .. tostring(click), 40, 350)
end