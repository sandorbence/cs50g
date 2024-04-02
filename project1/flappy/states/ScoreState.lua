--[[
    ScoreState Class
    Author: Colton Ogden
    cogden@cs50.harvard.edu

    A simple state used to display the player's score before they
    transition back into the play state. Transitioned to from the
    PlayState when they collide with a Pipe.
]]

ScoreState = Class{__includes = BaseState}

--[[
    When we enter the score state, we expect to receive the score
    from the play state so we know what to render to the State.
]]
function ScoreState:enter(params)
    self.score = params.score
end

function ScoreState:update(dt)
    -- go back to play if enter is pressed
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown')
    end
end

function ScoreState:render()
    -- simply render the score to the middle of the screen
    love.graphics.setFont(flappyFont)
    love.graphics.printf('Oof! You lost!', 0, 64, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Score: ' .. tostring(self.score), 0, 100, VIRTUAL_WIDTH, 'center')

    if self.score >= 50 then
        local image = love.graphics.newImage('gold-medal.png')
        placeMedal(image)
        love.graphics.printf('You earned a gold medal!', 0 , 150, VIRTUAL_WIDTH, 'center')
    elseif self.score >= 25 then
        local image = love.graphics.newImage('silver-medal.png')
        placeMedal(image)
        love.graphics.printf('You earned a silver medal!', 0, 150, VIRTUAL_WIDTH, 'center')
    elseif self.score >= 10 then
        local image = love.graphics.newImage('bronze-medal.png')
        placeMedal(image)
        love.graphics.printf('You earned a bronze medal!', 0, 150, VIRTUAL_WIDTH, 'center')
    end

    love.graphics.printf('Press Enter to Play Again!', 0, 200, VIRTUAL_WIDTH, 'center')
end

function placeMedal(image)
    local scale = 0.05
    local scaledWidth = image:getWidth() * scale
    local scaledHeight = image:getHeight() * scale
    local posX = (VIRTUAL_WIDTH - scaledWidth) / 2
    local posY = (VIRTUAL_HEIGHT - scaledHeight) / 2
    love.graphics.draw(image, posX, posY, 0 , 0.05, 0.05)
end