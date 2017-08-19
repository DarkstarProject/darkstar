---------------------------------------------------------------------------------------------------
-- func: Teleports player to Fafnir.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "iiii"
};
function onTrigger(player, x, y, z, zone)
if (player:getVar("inJail") ~= 0) then
		player:setPos('63', '6', '24', '221', '154');
end