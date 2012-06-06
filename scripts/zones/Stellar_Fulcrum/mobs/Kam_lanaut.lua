-----------------------------------
-- Area: Throne Room
-- NPC:  Kam'lanaut
-- Zilart Mission 8 BCNM Fight
-----------------------------------
package.loaded["scripts/zones/Stellar_Fulcrum/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/missions");
require("scripts/zones/Stellar_Fulcrum/TextIDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
	
	-- Record management
	record = GetServerVariable("[BF]Mission_Zilart_8_record");
	partyMembers = 1;
	killer:setTitle(DESTROYER_OF_ANTIQUITY);
	
	newtimer = os.time() - killer:getVar("BCNM_Timer");
		
	if(newtimer < record) then
		SetServerVariable("[BF]Mission_Zilart_8_record",newtimer);
	end

	if(killer:getCurrentMission(ZILART) == RETURN_TO_DELKFUTTS_TOWER) then
		killer:startEvent(0x7d01,0,record,0,newtimer,partyMembers,0,0);
	else
		killer:startEvent(0x7d01,0,record,0,newtimer,partyMembers,0,1);
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
		if(player:getCurrentMission(ZILART) == RETURN_TO_DELKFUTTS_TOWER) then
			player:completeMission(ZILART,RETURN_TO_DELKFUTTS_TOWER);
			player:addMission(ZILART,ROMAEVE);
			player:setVar("ZilartStatus",0);
		end
	end
	
end;