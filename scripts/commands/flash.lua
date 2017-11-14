---------------------------------------------------------------------------------------------------
-- func: speed
-- desc: Sets the players movement speed.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
};

function onTrigger(player, speed)
    player:speed(255);
    player:PrintToPlayer("Use @fixspeed to go back to normal <-", 0xF);
end