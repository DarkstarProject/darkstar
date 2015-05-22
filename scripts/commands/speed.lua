---------------------------------------------------------------------------------------------------
-- func: speed
-- desc: Sets the players movement speed.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "i"
};

function onTrigger(player, speed)
    player:speed( speed );
end