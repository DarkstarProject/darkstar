-----------------------------------
-- Area: Chamber of Oracles
-- NPC:  Triarius V-VIII
-- Zilart 6 Fight
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/missions");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath Action
-----------------------------------

function onMobDeath(mob,killer)
	
	
	killer:setVar("BCNM_Killed",killer:getVar("BCNM_Killed") + 1)
	
	if(killer:getVar("BCNM_Killed") >= 3) then
		newtimer = os.time() - killer:getVar("BCNM_Timer");
		
		if(newtimer < record) then
			SetServerVariable("[BF]Mission_Zilart_6_record",newtimer);
		end
		
		if(killer:getCurrentMission(ZILART) == THROUGH_THE_QUICKSAND_CAVES) then
			killer:startEvent(0x7d01,0,record,0,newtimer,1,0,0);
		else
			killer:startEvent(0x7d01,0,record,0,newtimer,1,0,1);
		end
	end
	
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
		if(player:getCurrentMission(ZILART) == THROUGH_THE_QUICKSAND_CAVES) then
			player:completeMission(ZILART,THROUGH_THE_QUICKSAND_CAVES);
			player:addMission(ZILART,THE_CHAMBER_OF_ORACLES);
		end
	end
	
end;