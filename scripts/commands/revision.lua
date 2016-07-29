---------------------------------------------------------------------------------------------------
-- func: revision
-- desc: Sends the Git revision to the player
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
};

function onTrigger(player)
    player:SendRevision();
end