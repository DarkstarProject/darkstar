-----------------------------------
-- Area: Beadeaux
-- NPC: Copper Quadav
-- Involved in Mission 3-1 (Bastok)
-----------------------------------

package.loaded["scripts/zones/Beadeaux/TextIDs"] = nil;
require("scripts/zones/Beadeaux/TextIDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------
function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath Action
-----------------------------------
function onMobDeath(mob, killer)

	if (killer:getCurrentMission(1) == 10) then
		missionStatus = killer:getVar("MissionStatus");

		if (missionStatus < 22) then
			killer:setVar("MissionStatus", missionStatus + 1)
		end
	end
end;
