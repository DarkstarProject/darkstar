---------------------------------------------------------------------------------------------------
-- func:  @aspi
-- auth: <Unknown> :: Modded by Tagban - Updated by Ninji
-- desc: Sets the players position to specific location (can be added to later).
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
            player:setPos('0', '-1', '-51', '176', '128');
    end
end