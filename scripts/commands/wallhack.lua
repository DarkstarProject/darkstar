---------------------------------------------------------------------------------------------------
-- func: wallhack
-- desc: Allows the player to walk through walls.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "s"
};

function onTrigger(player, target)
    target = GetPlayerByName(target) or player;
    target:setFlag( 0x00000200 );
end