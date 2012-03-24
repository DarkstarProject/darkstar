-----------------------------------
-- Area: Chamber of Oracles
-- NPC:  Maat
-- Genkai 5 Fight
-----------------------------------
package.loaded["scripts/zones/Chamber_of_Oracles/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/quests");
require("scripts/zones/Chamber_of_Oracles/TextIDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath Action
-----------------------------------

function onMobDeath(mob,killer)
	
	mJob = killer:getMainJob();
	killer:setVar("maatDefeated",1);
	record = GetServerVariable("[BF]Shattering_Stars_job"..mJob.."_record");
	if(mJob == 2) then bcnmFight = 5; elseif(mJob == 3) then bcnmFight = 6; else bcnmFight = 7; end
	
	newtimer = os.time() - killer:getVar("BCNM_Timer");
		
	if(newtimer < record) then
		SetServerVariable("[BF]Shattering_Stars_job"..mJob.."_record",newtimer);
	end
	
	killer:startEvent(0x7d01,0,record,0,newtimer,1,bcnmFight,0);
	
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
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
--printf("onFinish CSID: %u",csid);
--printf("onFinish RESULT: %u",option);
	
	if(csid == 0x7d01) then
		if(player:getQuestStatus(JEUNO,SHATTERING_STARS) == QUEST_ACCEPTED and player:getFreeSlotsCount() > 0) then
			player:addItem(4181);
			player:messageSpecial(ITEM_OBTAINED,4181);
		end
		player:setTitle(MAAT_MASHER);
	end
	
end;