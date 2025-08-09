function getCursorPosition()
    x, y = love.mouse.getPosition( )
    return x,y
end

function checkMouseClick()
    -- Checks if the primary mouse button is depressed
    button = 1
    down = love.mouse.isDown( button)
    return down
end