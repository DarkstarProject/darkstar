---------------------------------------------------------------------------------------------------
-- func: @boom
-- auth: TeoTwawki
-- desc: Murders moron who is trying to use boom and removes 500 exp from them
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
};

function onTrigger(player)
    -- Begin Wrath of the Gods Animation
    player:injectActionPacket( 5, 271 );
    player:injectActionPacket( 5, 202 );
    player:injectActionPacket( 5, 207 );
    player:injectActionPacket( 5, 216 );
    player:injectActionPacket( 5, 270 );
    -- End Wrath of the Gods Animation
    player:setHP(0); -- DIE!
    player:delExp(500); -- Kiss some exp goodbye moron!
end;