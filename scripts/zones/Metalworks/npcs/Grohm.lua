-----------------------------------
-- Area: Metalworks
-- NPC:  Grohm
-- Involved In Mission: Journey Abroad
-- @pos -18 -11 -27 237
-----------------------------------
package.loaded["scripts/zones/Metalworks/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/missions");
require("scripts/zones/Metalworks/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	if (player:getCurrentMission(SANDORIA) == JOURNEY_TO_BASTOK) then
		if (player:getVar("notReceivePickaxe") == 1) then
			player:startEvent(0x01a9);
		elseif (player:getVar("MissionStatus") == 4) then
			player:startEvent(0x01a7);
		elseif (player:getVar("MissionStatus") == 5 and player:hasItem(599) == false) then
			player:startEvent(0x01a8);
		else
			player:startEvent(0x01a6);
		end
	elseif (player:getCurrentMission(SANDORIA) == JOURNEY_TO_BASTOK2) then
		if (player:getVar("MissionStatus") == 9) then
			player:startEvent(0x01aa);
		else
			player:startEvent(0x01ab);
		end
	elseif (player:getCurrentMission(WINDURST) == THE_THREE_KINGDOMS_BASTOK) then
		if (player:getVar("notReceivePickaxe") == 1) then
			player:startEvent(0x01a9,1);
		elseif (player:getVar("MissionStatus") == 4) then
			player:startEvent(0x01a7,1);
		elseif (player:getVar("MissionStatus") == 5 and player:hasItem(599) == false) then
			player:startEvent(0x01a8,1);
		else
			player:startEvent(0x01a6);
		end
	elseif (player:getCurrentMission(WINDURST) == THE_THREE_KINGDOMS_BASTOK2) then
		if (player:getVar("MissionStatus") == 9) then
			player:startEvent(0x01aa,1);
		else
			player:startEvent(0x01ab,1);
		end
	else
		player:startEvent(0x01ab);--0x01a6
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
	
	if (csid == 0x01a7 or csid == 0x01a9) then
		if (player:getFreeSlotsCount() == 0) then 
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,605); -- Pickaxes
			player:setVar("notReceivePickaxe",1);
		else
			player:addItem(605,5);
			player:messageSpecial(ITEM_OBTAINED,605); -- Pickaxes
			player:setVar("MissionStatus",5);
			player:setVar("notReceivePickaxe",0);
		end
	elseif (csid == 0x01aa) then
		player:setVar("MissionStatus",10);
	end
	
end;