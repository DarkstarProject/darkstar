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
	
	killer:startEvent(0x7d01,0,record,0,(os.time() - killer:getVar("ShivaFight_Timer")),partyMembers,0,0);
	
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("onUpdate CSID: %u",csid);
--printf("onUpdate RESULT: %u",option);
	
	if(csid == 0x7d01) then
		player:delStatusEffect(EFFECT_BATTLEFIELD);
	end
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("onFinish CSID: %u",csid);
--printf("onFinish RESULT: %u",option);

	pZone = player:getZone();

	if(csid == 0x7d01) then
		if(player:getVar(tostring(pZone) .. "_Fight") == 100) then
			player:delKeyItem(TUNING_FORK_OF_ICE);
			player:addKeyItem(WHISPER_OF_FROST);
			player:messageSpecial(KEYITEM_OBTAINED,WHISPER_OF_FROST);
			player:setVar("ShivaFight_Timer",0);
			player:setVar("ShivaFight_Killed",0);
			player:setVar(tostring(pZone) .. "_Ready",0);
			player:setVar(tostring(pZone) .. "_Field",0);
			player:setVar(tostring(pZone) .. "_Fight",0);
		end
	end
	
end;