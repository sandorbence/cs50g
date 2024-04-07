Powerup = Class{}

function Powerup:init(skin)
    self.x = 100
    self.y = 100

    self.skin = skin
end

function Powerup:update(dt)
    self.y = self.y + 10 * dt
end

function Powerup:render()
    love.graphics.draw(gTextures['main'], gFrames['powerups'][self.skin],
    self.x, self.y)
end