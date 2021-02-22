x = 100
y = 100
platformX = 50

love.draw = function ()
    love.graphics.circle("line", x, y, 100)
    love.graphics.rectangle("fill", platformX, 10, 60, 10)
end

love.update = function (dt)
    x = x + 100 * dt
    y = y + 200 * dt
    platformX = love.mouse.getX()
end
