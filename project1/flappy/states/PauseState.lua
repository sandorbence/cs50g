PauseState = Class{__includes = BaseState}

function PauseState:init()
    self.bird = Bird()
    self.pipePairs = {}
    self.timer = 0
    self.score = 0
    self.lastY = 0
end

function PauseState:update(dt)
     -- resume the game
     if love.keyboard.wasPressed('p') then
        gStateMachine:change('play', {
            bird = self.bird,
            pipePairs = self.pipePairs,
            timer = self.timer,
            score = self.score,
            lastY = self.lastY
        })
    end
end

function PauseState:render()
    local image = love.graphics.newImage('pause.png')
    local scale = 0.2
    local scaledWidth = image:getWidth() * scale
    local scaledHeight = image:getHeight() * scale
    local posX = (VIRTUAL_WIDTH - scaledWidth) / 2
    local posY = (VIRTUAL_HEIGHT - scaledHeight) / 2
    love.graphics.draw(image, posX, posY, 0 , scale, scale)
end

function PauseState:enter(params)
    self.bird = params.bird
    self.pipePairs = params.pipePairs
    self.timer = params.timer
    self.score = params.score
    self.lastY = params.lastY

    sounds['music']:pause()
    sounds['pause']:play()
end

function PauseState:exit()
    sounds['music']:play()
end