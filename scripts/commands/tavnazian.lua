---------------------------------------------------------------------------------------------------
-- func: Teleports player to Tavnazian Safehold.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "iiii"
};
function onTrigger(player, x, y, z, zone)
		player:setPos('0', '-22', '7', '245', '26');
end