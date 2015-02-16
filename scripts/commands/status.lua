---------------------------------------------------------------------------------------------------
-- func: status
-- auth: <Unknown>
-- desc: Injects a status id to the player.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "ii"
};

function onTrigger(player, statusId)
    player:addStatusEffect( statusId );
end