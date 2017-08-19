---------------------------------------------------------------------------------------------------
-- func: Teleports player to Altepa Gate Crystal.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "iiii"
};
function onTrigger(player, x, y, z, zone)
		player:setPos('-60', '3', '224', '245', '114');
end