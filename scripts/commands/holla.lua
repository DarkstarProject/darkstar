---------------------------------------------------------------------------------------------------
-- func: Teleports player to Holla Gate Crystal.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "iiii"
};
function onTrigger(player, x, y, z, zone)
		player:setPos('420', '19', '22', '245', '102');
end