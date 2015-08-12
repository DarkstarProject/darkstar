-----------------------------------
-- Area: Beadeaux
-- NPC: Copper Quadav
-- Involved in Mission 3-1 (Bastok)
-----------------------------------
package.loaded["scripts/zones/Beadeaux/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/missions");
require("scripts/zones/Beadeaux/TextIDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath Action
-----------------------------------

function onMobDeath(mob, killer)

	if (killer:getCurrentMission(BASTOK) == THE_FOUR_MUSKETEERS) then
		local missionStatus = killer:getVar("MissionStatus");

		if (missionStatus > 1 and missionStatus < 22) then
			killer:setVar("MissionStatus", missionStatus + 1)
		end
	end

end;