local Quad = love.graphics.newQuad
function love.load()
    x = 0.0;
    Player = {
        x = 0;
        y = 0;
        moving = false;
        speed = 2;
        --shader = love.graphics.newShader("shaders/playerpixelshader.ps", "shaders/playervertexshader.vs");
    }


    Timy = love.graphics.newImage("GFX/Timy.png")
    Anon = love.graphics.newImage("GFX/anon.jpg")
    Timy:setFilter("nearest", "nearest")
    TimyQuadMap = {
        Quad(0, 0, 32, 32, Timy:getWidth(), Timy:getHeight()),
        Quad(32, 0, 32, 32, Timy:getWidth(), Timy:getHeight()),
        Quad(0, 32, 32, 32, Timy:getWidth(), Timy:getHeight()),
        Quad(32, 32, 32, 32, Timy:getWidth(), Timy:getHeight()),
    }

    shader = love.graphics.newShader("shaders/pixelshader.ps")
end

function love.update(dt)


    if love.keyboard.isDown('d', 'right') then
        Player['x'] = Player['x'] + Player['speed']
    end
    if love.keyboard.isDown('a', 'left') then
        Player['x'] = Player['x'] - Player['speed']
    end
    if love.keyboard.isDown('s', 'down') then
        Player['y'] = Player['y'] + Player['speed']
    end
    if love.keyboard.isDown('w', 'up') then
        Player['y'] = Player['y'] - Player['speed']
    end

    shader:send("aperture", 180.0)

end

function love.draw()
    love.graphics.setBackgroundColor(255, 200, 100)
    love.graphics.setShader(shader)
    --love.graphics.rectangle('fill', 0, 0, 1000, 1000)
    --love.graphics.draw(Timy, TimyQuadMap[1], Player['x'], Player['y'], 0, 4, 4)
    love.graphics.draw(Anon, Player['x'], Player['y'], 0, .5, .5);
    love.graphics.setShader()

end
