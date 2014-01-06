-----------------------------------
--
-- Zone: FeiYin (204)
--
-----------------------------------
package.loaded["scripts/zones/FeiYin/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/FeiYin/TextIDs");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)		
end;		

-----------------------------------		
-- onZoneIn		
-----------------------------------		

function onZoneIn(player,prevZone)		
	local cs = -1;	
	
	if((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then	
		player:setPos(99.98,-1.768,275.993,70);
	end	
	
	if(prevZone == 111 and player:getQuestStatus(SANDORIA,PIEUJE_S_DECISION) == QUEST_ACCEPTED and player:getVar("pieujesDecisionCS") == 0) then	
		cs = 0x0013; -- WHM AF
		player:setVar("pieujesDecisionCS",1);
	elseif(prevZone == 206 and player:getQuestStatus(BASTOK,THE_FIRST_MEETING) == QUEST_ACCEPTED and player:hasKeyItem(LETTER_FROM_DALZAKK) == false) then	
		cs = 0x0010; -- MNK AF
	elseif(player:getVar("peaceForTheSpiritCS") == 1 and player:hasItem(1093) == false) then -- Antique Coin	
		SpawnMob(17612849); -- RDM AF
	elseif(prevZone == 111 and player:getCurrentMission(player:getNation()) == 14 and player:getVar("MissionStatus") == 10) then
		cs = 0x0001; -- MISSION 5-1
	end	
	
	return cs;	
	
end;		

-----------------------------------		
-- onRegionEnter		
-----------------------------------		

function onRegionEnter(player,region)		
end;		

-----------------------------------		
-- onEventUpdate		
-----------------------------------		

function onEventUpdate(player,csid,option)		
	--printf("CSID: %u",csid);	
	--printf("RESULT: %u",option);	
end;		

-----------------------------------		
-- onEventFinish		
-----------------------------------		

function onEventFinish(player,csid,option)		
	--printf("CSID: %u",csid);	
	--printf("RESULT: %u",option);	
	if(csid == 0x0010) then	
		player:addKeyItem(LETTER_FROM_DALZAKK);
		player:messageSpecial(KEYITEM_OBTAINED,LETTER_FROM_DALZAKK);
	elseif(csid == 0x0001) then
		player:setVar("MissionStatus",11);
	end	
end;		
