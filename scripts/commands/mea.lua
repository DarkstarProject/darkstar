---------------------------------------------------------------------------------------------------
-- func: Teleports player to Mea Gate Crystal.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "iiii"
};
function onTrigger(player, x, y, z, zone)
		player:setPos('95', '35', '340', '245', '117');
end