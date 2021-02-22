x = 100
y = 100
platformX = 50

love.draw = function ()
    love.graphics.circle("fill", x, y, 20)
    love.graphics.rectangle("fill", platformX, 550, 80, 10)
end

love.update = function (dt)
    x = x + 100 * dt
    y = y + 400 * dt
    platformX = love.mouse.getX()
end
