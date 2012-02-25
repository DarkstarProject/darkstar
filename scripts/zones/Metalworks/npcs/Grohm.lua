-----------------------------------
-- Area: Metalworks
-- NPC:  Grohm
-- Involved In Mission: Journey Abroad
-- @zone 237
-- @pos -18.084 -11 -27.576
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
	
	if(player:getCurrentMission(SANDORIA) == JOURNEY_TO_BASTOK) then
		if(player:getVar("notReceivePickaxe") == 1) then
			player:startEvent(0x01a9);
		elseif(player:getVar("MissionStatus") == 4) then
			player:startEvent(0x01a7);
		elseif(player:getVar("MissionStatus") == 5) then
			player:startEvent(0x01a8);
		end
	elseif(player:getCurrentMission(SANDORIA) == JOURNEY_TO_BASTOK2) then
		if(player:getVar("MissionStatus") == 9) then
			player:startEvent(0x01aa);
		else
			player:startEvent(0x01ab);
		end
	else
		player:startEvent(0x01a6);
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
	
	if(csid == 0x01a7 or csid == 0x01a9) then
		if(player:getFreeSlotsCount() == 0) then 
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,605); -- Pickaxes
			player:setVar("notReceivePickaxe",1);
		else
			player:addItem(605,5);
			player:messageSpecial(ITEM_OBTAINED,605); -- Pickaxes
			player:setVar("MissionStatus",5);
			player:setVar("notReceivePickaxe",0);
		end
	elseif(csid == 0x01aa) then
		player:setVar("MissionStatus",10);
	end
	
end;