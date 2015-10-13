-----------------------------------
-- Area: Metalworks
-- NPC:  Savae E Paleade
-- Involved In Mission: Journey Abroad
-- @pos 23.724 -17.39 -43.360 237
-----------------------------------
package.loaded["scripts/zones/Metalworks/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/zones/Metalworks/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	if (player:getCurrentMission(SANDORIA) == JOURNEY_TO_BASTOK and player:getVar("MissionStatus") == 5) then
		if (trade:hasItemQty(599,1) and trade:getItemCount() == 1) then -- Trade Mythril Sand
			player:startEvent(0x00cd);
		end
	end
	
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	-- San d'Oria Mission 2-3 Part I - Bastok > Windurst
	if (player:getCurrentMission(SANDORIA) == JOURNEY_ABROAD and player:getVar("MissionStatus") == 2) then
		player:startEvent(0x00cc);
	-- San d'Oria Mission 2-3 Part II - Windurst > Bastok
	elseif (player:getCurrentMission(SANDORIA) == JOURNEY_ABROAD and player:getVar("MissionStatus") == 7) then
		player:startEvent(0x00ce);
	elseif (player:getCurrentMission(SANDORIA) == JOURNEY_TO_BASTOK2 and player:getVar("MissionStatus") == 11) then
		player:startEvent(0x00cf);
	-----------------
	elseif (player:getCurrentMission(SANDORIA) ~= 255) then
		player:startEvent(0x00d0);
	else
		player:startEvent(0x00c8);
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
	
	if (csid == 0x00cc) then
		player:addMission(SANDORIA,JOURNEY_TO_BASTOK);
		player:setVar("MissionStatus",3);
		player:delKeyItem(LETTER_TO_THE_CONSULS_SANDORIA);
	elseif (csid == 0x00cd) then
		player:tradeComplete();
		player:setVar("MissionStatus",6);
		player:addMission(SANDORIA,JOURNEY_ABROAD);
	elseif (csid == 0x00ce) then
		player:addMission(SANDORIA,JOURNEY_TO_BASTOK2);
		player:setVar("MissionStatus",8);
	elseif (csid == 0x00cf) then
		player:addMission(SANDORIA,JOURNEY_ABROAD);
		player:delKeyItem(KINDRED_CREST);
		player:addKeyItem(KINDRED_REPORT);
		player:messageSpecial(KEYITEM_OBTAINED,KINDRED_REPORT);
	end
	
end;