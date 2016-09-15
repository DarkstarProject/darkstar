---------------------------------------------------------------------------------------------------
-- func: Bastok
-- auth: <Unknown> :: Modded by Tagban
-- desc: Sets the players position to specific location (Bastok).
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
            player:setPos('59', '8', '-229', '245', '236');
    end
end