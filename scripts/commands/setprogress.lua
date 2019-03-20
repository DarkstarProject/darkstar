---------------------------------------------------------------------------------------------------
-- func: setprogress
-- desc: changes progress inside instance
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "i"
};

function error(player, msg)
end

function onTrigger(player, progress)
    local instance = player:getInstance()
    local start = instance:getProgress()
    instance:setProgress(progress)
    player:PrintToPlayer(string.format("Progress changed from %i to %i", start, progress))
end
