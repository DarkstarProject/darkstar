---------------------------------------------------------------------------------------------------
-- func: Teleports player to Yhoator Gate Crystal.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "iiii"
};
function onTrigger(player, x, y, z, zone)
		player:setPos('-280', '0', '-146', '245', '124');
end