---------------------------------------------------------------------------------------------------
-- func: Tavnazian Safehold
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
            player:setPos('95', '35', '340', '245', '117');
end
end