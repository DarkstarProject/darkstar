---------------------------------------------------------------------------------------------------
-- func:  @Hahava
-- auth: Hiro
-- desc: Sets the players position to specific location 
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "iiii"
};
function onTrigger(player, x, y, z, zone)
            player:setPos('-59', '8', '156', '46', '190');
end