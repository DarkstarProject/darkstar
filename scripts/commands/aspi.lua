---------------------------------------------------------------------------------------------------
-- func:  Teleports player to Aspidochelone/Adamantoise
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "iiii"
};
function onTrigger(player, x, y, z, zone)
		player:setPos('0', '-1', '-51', '176', '128');
end