---------------------------------------------------------------------------------------------------
-- func: Teleports player to King Behemoth.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "iiii"
};
function onTrigger(player, x, y, z, zone)
		player:setPos('-282', '-19', '68', '241', '127');
end