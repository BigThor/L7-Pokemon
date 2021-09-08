--[[
    GD50
    Pokemon

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

LevelupMenuState = Class{__includes = BaseState}

function LevelupMenuState:init(previousStats, statsIncrease, onClose )
    self.previousStats = previousStats
    self.statsIncrease = statsIncrease
    self.onClose = onClose or function() end

    self.levelupMenu = Menu {
        x = VIRTUAL_WIDTH / 2 - 80,
        y = 10,
        width = 160,
        height = 160,
        items = {
            {
                text = 'HP      ' .. previousStats.HP .. '+' .. statsIncrease.HP .. '=' .. (previousStats.HP + statsIncrease.HP)
            },
            {
                text = 'Attack  ' .. previousStats.attack .. '+' .. statsIncrease.attack .. '=' .. (previousStats.attack + statsIncrease.attack)
            },
            {
                text = 'Defense ' .. previousStats.defense .. '+' .. statsIncrease.defense .. '=' .. (previousStats.defense + statsIncrease.defense)
            },
            {
                text = 'Speed   ' .. previousStats.speed .. '+' .. statsIncrease.speed .. '=' .. (previousStats.speed + statsIncrease.speed)
            }
        },
        showCursor = false
    }
end

function LevelupMenuState:update(dt)
    self.levelupMenu:update(dt)
    if self.levelupMenu.isClosed then
        gStateStack:pop()
        self.onClose()
    end
end

function LevelupMenuState:render()
    self.levelupMenu:render()
end