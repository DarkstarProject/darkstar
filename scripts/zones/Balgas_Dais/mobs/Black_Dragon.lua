-----------------------------------
-- Area: Balga's Dais
-- NPC: Black Dragon
-- Mission 2-3 BCNM Fight
-----------------------------------

require("scripts/globals/titles");
package.loaded["scripts/zones/Ghelsba_Outpost/TextIDs"] = nil;
require("scripts/zones/Ghelsba_Outpost/TextIDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------
function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath Action
-----------------------------------
function onMobDeath(mob, killer)


	killer:setVar("Mission_2_3_Killed",killer:getVar("Mission_2_3_Killed") + 1);
	record = 300;
	partyMembers = 6;
	killer:setTitle(BLACK_DRAGON_SLAYER);

	if (killer:getVar("Mission_2_3_Killed") == 2) then
		if (killer:hasCompletedMission(killer:getNation(),5) == 1) then
			killer:startEvent(0x7D01,0,record,0,(os.time() - killer:getVar("Mission_2_3_Timer")),partyMembers,0,1);
		else
			killer:startEvent(0x7D01,0,record,0,(os.time() - killer:getVar("Mission_2_3_Timer")),partyMembers,0,0);
		end
	end
end;
