---------------------------------------------------------------------------------------------------
-- Func: Teleports player to Port Windurst 
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "iiii"
};
function onTrigger(player, x, y, z, zone) 
		player:setPos('198', '-12', '223', '54', '240');
end
