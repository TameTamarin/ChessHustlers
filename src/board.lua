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