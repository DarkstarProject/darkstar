---------------------------------------------------------------------------------------------------
-- func: setstage
-- desc: changes stage inside instance
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "i"
};

function error(player, msg)
end

function onTrigger(player, stage)
    local instance = player:getInstance()
    local start = instance:getStage()
    instance:setStage(stage)
    player:PrintToPlayer(string.format("Stage changed from %i to %i", start, stage))
end
