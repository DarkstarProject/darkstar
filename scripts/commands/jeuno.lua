---------------------------------------------------------------------------------------------------
-- func: Teleports player to Port Jeuno
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "iiii"
};
function onTrigger(player, x, y, z, zone) 
     player:setPos('-117', '-5', '0', '245', '246');
end