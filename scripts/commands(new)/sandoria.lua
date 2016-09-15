---------------------------------------------------------------------------------------------------
-- func: Sandoria
-- auth: <Unknown> :: Modded by Tagban
-- desc: Sets the players position to specific location (Sandoria).
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "iiii"
};
function onTrigger(player, x, y, z, zone)
if (player:getVar("inJail") ~= 0) then
        player:PrintToPlayer( string.format( "You've been bad." ) );
else
            player:setPos('120', '0', '1', '53', '231');
end
end