---------------------------------------------------------------------------------------------------
-- func: Fafnir
-- auth: <Unknown> :: Modded by Tagban
-- desc: Sets the players position to specific location (Fafnir).
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
            player:setPos('1', '-8', '49', '245', '249');
end
end