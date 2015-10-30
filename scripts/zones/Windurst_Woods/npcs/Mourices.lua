-----------------------------------
-- Area: Windurst Woods
-- NPC:  Mourices
-- Involved In Mission: Journey Abroad
-- @zone 241
-- @pos -50.646 -0.501 -27.642
-----------------------------------
package.loaded["scripts/zones/Windurst_Woods/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/zones/Windurst_Woods/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	MissionStatus = player:getVar("MissionStatus");
	
	if (player:getCurrentMission(SANDORIA) == JOURNEY_TO_WINDURST and trade:hasItemQty(12298,2) and trade:getItemCount() == 2) then -- Trade 2 Parana Shield
		if (MissionStatus == 5) then
			player:startEvent(0x1c7); -- before deliver shield to the yagudo
		elseif (MissionStatus == 6) then
			player:startEvent(0x01c9); -- after deliver...Finish part of this quest
		end
	end
	
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	MissionStatus = player:getVar("MissionStatus");
	
	if (player:getCurrentMission(SANDORIA) == JOURNEY_ABROAD) then 
		-- San d'Oria Mission 2-3 Part I - Windurst > Bastok
		if (MissionStatus == 2) then
			player:startEvent(0x01c0);
		elseif (MissionStatus == 7) then
			player:startEvent(0x1ca);
		-- San d'Oria Mission 2-3 Part II - Bastok > Windurst
		elseif (MissionStatus == 6) then
			player:startEvent(0x01ce);
		elseif (MissionStatus == 11) then
			player:startEvent(0x1d4);
		end
	-- San d'Oria Mission 2-3 Part I - Windurst > Bastok
	elseif (player:getCurrentMission(SANDORIA) == JOURNEY_TO_WINDURST) then
		if (MissionStatus >= 3 and MissionStatus <= 5) then
			player:startEvent(0x01c1);
		elseif (MissionStatus == 6) then
			player:startEvent(0x01c8);
		end
	-- San d'Oria Mission 2-3 Part II - Bastok > Windurst
	elseif (player:getCurrentMission(SANDORIA) == JOURNEY_TO_WINDURST2) then
		if (MissionStatus == 7 or MissionStatus == 8) then
			player:startEvent(0x01cf);
		elseif (MissionStatus == 9 or MissionStatus == 10) then
			player:startEvent(0x01d3);
		end
	else
		player:startEvent(0x01b9);
	end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
-- printf("CSID: %u",csid);
-- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
-- printf("CSID: %u",csid);
-- printf("RESULT: %u",option);
	
	if (csid == 0x01c0) then
		player:addMission(SANDORIA,JOURNEY_TO_WINDURST);
		player:setVar("MissionStatus",3);
		player:delKeyItem(LETTER_TO_THE_CONSULS_SANDORIA);
	elseif (csid == 0x01c9) then
		player:setVar("MissionStatus",7);
		player:tradeComplete();
		player:addMission(SANDORIA,JOURNEY_ABROAD);
	elseif (csid == 0x01ce) then
		player:addMission(SANDORIA,JOURNEY_TO_WINDURST2);
		player:setVar("MissionStatus",7);
	elseif (csid == 0x01d3) then
		player:addMission(SANDORIA,JOURNEY_ABROAD);
		player:delKeyItem(KINDRED_CREST);
		player:setVar("MissionStatus",11);
		player:addKeyItem(KINDRED_REPORT);
		player:messageSpecial(KEYITEM_OBTAINED,KINDRED_REPORT);
	end
	
end;