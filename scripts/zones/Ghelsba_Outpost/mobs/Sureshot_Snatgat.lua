-----------------------------------
-- Area: Ghelsba Outpost
-- NPC:  Sureshot Snatgat
-- Involved in Mission: Save the Children
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath Action
-----------------------------------

function onMobDeath(mob, killer)

	killer:setVar("BCNM_Killed",killer:getVar("BCNM_Killed") + 1);
	record = 300;
	partyMembers = 6;
	pZone = killer:getZone();
	
	if(killer:getVar("BCNM_Killed") >= 3) then
		if(killer:hasCompletedMission(SANDORIA,SAVE_THE_CHILDREN)) then
			skip = 1;
		else
			skip = 0;
		end
		
		killer:startEvent(0x7d01,0,record,0,(os.time() - killer:getVar("BCNM_Timer")),partyMembers,0,skip);
	end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("onUpdate CSID: %u",csid);
--printf("onUpdate RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("onFinish CSID: %u",csid);
--printf("onFinish RESULT: %u",option);
	
	pZone = player:getZone();
	player:delStatusEffect(EFFECT_BATTLEFIELD);
	
	if(csid == 0x7d01 and option == 0) then
		player:setTitle(FODDERCHIEF_FLAYER);
		player:addKeyItem(ORCISH_HUT_KEY);
		player:messageSpecial(KEYITEM_OBTAINED,ORCISH_HUT_KEY);
		player:setVar("saveTheChildrenMissionCS",4);
	end
	
end;