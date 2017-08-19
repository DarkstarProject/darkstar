---------------------------------------------------------------------------------------------------
-- func: Teleports player to Vahzl Gate Crystal.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "iiii"
};
function onTrigger(player, x, y, z, zone)
		player:setPos('146', '-21', '-40', '245', '112');
end