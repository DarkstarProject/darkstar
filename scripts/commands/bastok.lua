---------------------------------------------------------------------------------------------------
-- func: Teleports players to Port Bastok.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "iiii"
};
function onTrigger(player, x, y, z, zone)
		player:setPos('59', '8', '-229', '245', '236');
end