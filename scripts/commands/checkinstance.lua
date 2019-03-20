---------------------------------------------------------------------------------------------------
-- func: checkinstance
-- desc: checks current stage an progress insidde an instance
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = ""
};

function error(player, msg)
end

function onTrigger(player, progress)
    local instance = player:getInstance()
    local progress = instance:getProgress()
    local stage = instance:getStage()

    player:PrintToPlayer(string.format("Stage: %i Progress: %i", stage, progress))
end
