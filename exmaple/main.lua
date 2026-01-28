local OpusPlayer = require("opusplayer")

local player

function love.load()
    player = OpusPlayer.newSource("song.opus", "stream")

    player:play()
    
    print("Source type: " .. player:getType())
end

function love.update(dt)
    if player then
        player:update()
    end
end

function love.draw()
    if player then
        local stats = player:getStats()
        love.graphics.print("Playing Opus (" .. stats.source_type .. ")", 50, 50)
        love.graphics.print("Packets decoded: " .. stats.packets_decoded, 50, 70)
        love.graphics.print("Free buffers: " .. stats.free_buffers, 50, 90)
        love.graphics.print("Is playing: " .. tostring(stats.is_playing), 50, 110)
        love.graphics.print("Finished: " .. tostring(stats.finished), 50, 130)
        
        love.graphics.print("Press SPACE to pause/resume", 50, 170)
        love.graphics.print("Press ESC to quit", 50, 190)
    end
end

function love.quit()
    if player then
        player:destroy()
    end
end

function love.keypressed(key)
    if key == "space" then
        if player:isPlaying() then
            player:pause()
        else
            player:play()
        end
    elseif key == "up" then
        player:setVolume(math.min(1, player:getVolume() + 0.1))
    elseif key == "down" then
        player:setVolume(math.max(0, player:getVolume() - 0.1))
    elseif key == "escape" then
        love.event.quit()
    end
end