
require("scripts/globals/status")

cmdprops =
{
    permission = 1,
    parameters = "i"
}

function onTrigger(player, matk)
    local target = player:getCursorTarget()
    if(target == nil) then 
        target = player
    end
    target:setMod(28, matk)
end