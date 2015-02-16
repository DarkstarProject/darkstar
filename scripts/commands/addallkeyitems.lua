---------------------------------------------------------------------------------------------------
-- func: @addallkeyitems
-- auth: <Unknown>
-- desc: BVravely tries to give every existing KI..which may break missions and quests
---------------------------------------------------------------------------------------------------

cmdprops=
{
	permission = 1,
	parameters = ""
}
function onTrigger(player)
	require("scripts/globals/keyitems");
	z=1;
	while z <= 2544 do
		player:addKeyItem(z);
		z = z + 1;
	end
end