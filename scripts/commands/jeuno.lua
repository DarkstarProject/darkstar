---------------------------------------------------------------------------------------------------
-- func: Port Jeuno
-- auth: <Unknown> :: Modded by Kernel
-- desc: Sets the players position to specific location (Travnazian Safehold).
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "iiii"
};
function onTrigger(player, x, y, z, zone) 
if (player:getVar("inJail") ~= 0) then
        player:PrintToPlayer( string.format( "You've been bad, (Probably). Please contact a GM in game or on Slack for help." ) );
else
     player:setPos('-117', '-5', '0', '245', '246');
end
end