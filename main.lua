platformX = 50
platformY = 550
bounceFloor = platformY-10


function love.load()
    mode = "menu"
    resetValues()
end

love.draw = function ()
    if mode == "menu" then
        menuDraw()
    elseif mode == "game" then
        gameDraw()
        scoreDraw()
    elseif mode == "gameover" then
        gameoverDraw()
    end
end

love.update = function (dt)
    if mode == "menu" then
        menuUpdate(dt)
    elseif mode == "game" then
        gameUpdate(dt)
    else
        menuUpdate(dt)
    end
end

menuDraw = function ()
    love.graphics.setColor(0.4, 0.4, 0.5, 1)
    love.graphics.rectangle("fill", 325, 200, 150, 50)
    love.graphics.rectangle("fill", 325, 260, 150, 50)
    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.print("Start Game", 330, 210, 0, 2)
    love.graphics.print("Exit", 375, 267, 0, 2)
end

menuUpdate = function()
    if love.mouse.isDown(1) then
        local mX, mY = love.mouse.getPosition()
        print(mX, mY)
        if mX < 475 and mX > 325 and mY < 250 and mY > 200 then
            resetValues()
            mode = "game"
        end

        if mX < 475 and mX > 325 and mY < 310 and mY > 260 then
            love.event.quit(0)
        end
    end
end


-- Ball and platform
gameDraw = function ()
    love.graphics.setColor(0, 0, 1)
    love.graphics.circle("fill", x, y, 10)
    
    love.graphics.setColor(1, 0, 0)
    love.graphics.rectangle("fill", platformX, platformY, 80, 10)

end

-- Move platform
gameUpdate = function (dt)
    platformX = love.mouse.getX()
    print(platformX, x)

    -- Bounce off platform
    if y > bounceFloor and y < 560 and x > platformX and x < (platformX + 80) then
        directionY = -1
        gravity = gravity + 50
        directionX = directionX * 2
        score = score + 1
    elseif y < 0  then
        directionY = 1
    end

    -- Bounce against left wall
    if x < 0 then
        directionX = 1
    end

    -- Bounce against right wall
    if x > 800 then
        directionX = -1
    end

    -- Game over
    if y > 1000 then
        mode = "gameover"
    end

    -- Update ball position
    x = x + 100 * directionX * dt
    y = y + gravity * directionY * dt
    
end

gameoverDraw = function ()
    love.graphics.setColor(0.4, 0.4, 0.5, 1)
    love.graphics.rectangle("fill", 325, 200, 150, 50)
    love.graphics.rectangle("fill", 325, 260, 150, 50)
    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.print("Restart", 360, 210, 0, 2)
    love.graphics.print("Exit", 375, 267, 0, 2)
    love.graphics.setColor(255, 0, 0, 1)
    love.graphics.print("GAME OVER!", 290, 150, 0, 3)
end


resetValues = function ()
    x = 100
    y = 100
    directionY = 1
    directionX = -1
    gravity = 200
    score = 0
end

scoreDraw = function ()
    love.graphics.setColor(0, 255, 0, 1)
    love.graphics.print("Score: ", 10, 10, 0, 2)
    love.graphics.print(score, 100, 10, 0, 2)
-- skriva på skärmen
end

function love.conf(t)
	t.console = true
end