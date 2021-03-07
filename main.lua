x = 100
y = 100
platformX = 50
platformY = 550
bounceFloor = platformY-10
directionY = 1
directionX = 1

love.draw = function ()
    love.graphics.circle("fill", x, y, 10)
    love.graphics.rectangle("fill", platformX, platformY, 80, 10)
end

love.update = function (dt)
    platformX = love.mouse.getX()
    print(platformX, x)
    if y > bounceFloor and x > platformX and x < (platformX + 80) then
        directionY = -1
    elseif y < 0  then
        directionY = 1
    end
    if y > 600 then
        love.event.quit(0)
    end
    x = x + 100 * dt
    y = y + 400 * directionY * dt
    
end

function love.conf(t)
	t.console = true
end