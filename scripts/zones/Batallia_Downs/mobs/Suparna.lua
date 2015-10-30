-----------------------------------
-- Area: Batallia Downs
-- NPC:  Sturmtiger
-- Involved in Quest: Chasing Quotas
-- @pos -715.882,-10.75,65.982 (105)
-----------------------------------
require("scripts/globals/missions");
-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath Action
-----------------------------------

function onMobDeath(mob,killer)

	local kills = killer:getVar("Mission9-1Kills");

	if (killer:getCurrentMission(SANDORIA) == BREAKING_BARRIERS and killer:getVar("MissionStatus") == 3 and kills < 2) then
		killer:setVar("Mission9-1Kills",kills + 1);
	end

end;