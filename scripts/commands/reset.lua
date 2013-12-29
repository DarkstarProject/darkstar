---------------------------------------------------------------------------------------------------
-- func: reset
-- auth: <Unknown>
-- desc: Resets the players recasts.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = ""
};

function onTrigger(player)
    player:resetRecasts();
end