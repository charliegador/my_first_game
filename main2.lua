x = 650
y = 55
text = ""
mX = 650
mY = 55

love.draw = function ()
    love.graphics.circle("fill", 100, 100, 60)
    love.graphics.circle("fill", 300, 100, 60)
    love.graphics.circle("fill", 500, 100, 60)
    love.graphics.rectangle("fill", 650, 55, 100, 100)
    love.graphics.print(text, 0, 0)
end

function love.mousepressed(mX, mY, button)
    if button == 1 then
       text = "CORRECT!"
       nextDraw()
    end
end

nextDraw = function ()
    love.graphics.setColor(0, 255, 0, 1)
end