---------------------------------------------------------------------------------------------------
-- func: Kazham
-- auth: <Unknown> :: Modded by Tagban
-- desc: Sets the players position to specific location (Kazham).
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
            player:setPos('-46', '-9', '-83', '245', '250');
end
end