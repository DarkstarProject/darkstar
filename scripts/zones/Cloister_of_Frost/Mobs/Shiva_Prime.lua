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
	--player:delKeyItem(TUNING_FORK_OF_ICE);
	--player:addKeyItem(WHISPER_OF_FROST);
	killer:messageSpecial(KEYITEM_OBTAINED,WHISPER_OF_FROST);
	killer:setVar("ShivaFight_Timer",0);
	killer:setVar("ShivaFight_Killed",0);
	killer:setVar(tostring(pZone) .. "_Ready",0);
	killer:setVar(tostring(pZone) .. "_Field",0);
	killer:setVar(tostring(pZone) .. "_Fight",0);
	killer:delStatusEffect(EFFECT_BATTLEFIELD);
end;