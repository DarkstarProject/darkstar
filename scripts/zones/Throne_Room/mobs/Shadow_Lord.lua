-----------------------------------
-- Area: Throne Room
-- NPC:  Shadow Lord
-- Mission 5-2 BCNM Fight
-----------------------------------
package.loaded["scripts/zones/Balgas_Dais/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/zones/Balgas_Dais/TextIDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
	
	-- At 50% HP new CS and change mob
	-- target:startEvent(0x7d04);
	
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
	
	-- Record management
	record = GetServerVariable("[BF]Mission_5-2_Throne_Room_record");
	partyMembers = 1;
	killer:setTitle(SHADOW_BANISHER);
	
	newtimer = os.time() - killer:getVar("BCNM_Timer");
		
	if(newtimer < record) then
		SetServerVariable("[BF]Mission_5-2_Throne_Room_record",newtimer);
	end

	if(killer:getCurrentMission(killer:getNation()) == 15) then
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
		if(player:getCurrentMission(player:getNation()) == 15) then
			player:addMission(ZILART,THE_NEW_FRONTIER);
			player:addKeyItem(SHADOW_FRAGMENT);
			player:messageSpecial(KEYITEM_OBTAINED,SHADOW_FRAGMENT);
			player:setVar("MissionStatus",2);
			SetServerVariable("[BF]Mission_5-2_Enter",0);
		end
	end
	
end;