---------------------------------------------------------------------------------------------------
-- func: Teleports player to Dem Gate Crystal.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "iiii"
};
function onTrigger(player, x, y, z, zone)
		player:setPos('220', '19', '303', '245', '108');
end