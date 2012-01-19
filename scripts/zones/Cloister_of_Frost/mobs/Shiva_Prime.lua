-----------------------------------
-- Area: Cloister of Frost
-- NPC:  Shiva Prime
-- Involved in Quest: Trial by Ice
-- @zone 203
-- @pos 
-----------------------------------
package.loaded["scripts/zones/Cloister_of_Frost/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/Cloister_of_Frost/TextIDs");

-----------------------------------
-- OnMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end; 

-----------------------------------
-- OnMobDeath Action
-----------------------------------
function onMobDeath(mob, killer)
	killer:setVar("ShivaFight_Killed",killer:getVar("ShivaFight_Killed") + 1);
	record = 300;
	partyMembers = 6;
	pZone = killer:getZone();
	
	killer:startEvent(0x7D01,0,record,0,(os.time() - killer:getVar("ShivaFight_Timer")),partyMembers,0,0);
	
end;