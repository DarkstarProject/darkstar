---------------------------------------------------------------------------------------------------
-- func: Teleports player to Whitegate
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "iiii"
};
function onTrigger(player, x, y, z, zone)
		player:setPos('-94', '0', '-79', '245', '50');
end