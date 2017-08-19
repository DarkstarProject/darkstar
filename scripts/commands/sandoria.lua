---------------------------------------------------------------------------------------------------
-- func: Teleports player to Northern Sandoria.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "iiii"
};
function onTrigger(player, x, y, z, zone)
		player:setPos('120', '0', '1', '53', '231');
end