---------------------------------------------------------------------------------------------------
-- func: Teleports player to Jourmungand.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "iiii"
};
function onTrigger(player, x, y, z, zone)
		player:setPos('-194', '-176', '112', 'NULL', '5');
end