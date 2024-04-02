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