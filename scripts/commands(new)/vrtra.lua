---------------------------------------------------------------------------------------------------
-- func: vrtra/vrtra @vrtra
-- auth: <Unknown> :: Modded by Tagban
-- desc: Sets the players position to specific location (can be added to later).
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
}; 
function onTrigger(player, x, y, z, zone)
if (player:getVar("inJail") ~= 0) then
        player:PrintToPlayer( string.format( "You've been bad." ) );
else
            player:setPos('219', '7', '-294', '112', '190');
end
end