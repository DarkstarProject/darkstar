-----------------------------------
-- Area: Ghelsba Outpost
-- NPC: Hut Door
-- Involved in Quest: The Holy Crest
-----------------------------------
package.loaded["scripts/zones/Ghelsba_Outpost/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
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

	killer:setVar("TheHolyCrest_Killed",1);
	record = 1;
	partyMembers = 1;

	if(killer:getQuestStatus(SANDORIA,THE_HOLY_CREST) == QUEST_ACCEPTED) then
		skip = 0;
	else
		skip = 1;
	end

	killer:startEvent(0x7D01,0,record,0,(os.time() - killer:getVar("TheHolyCrest_Timer")),partyMembers,1,skip);

end;