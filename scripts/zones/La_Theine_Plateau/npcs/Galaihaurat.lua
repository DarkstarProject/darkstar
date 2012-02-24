-----------------------------------
-- Area: La Theine Plateau
-- NPC:  Galaihaurat
-- Involved in Mission: The Rescue Drill
-- @zone 102
-- @pos -482 -7 222
-----------------------------------

require("scripts/globals/missions");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	if(player:getCurrentMission(SANDORIA) == THE_RESCUE_DRILL) then
		theRescueDrillMissionCS = player:getVar("theRescueDrillMissionCS");
		
		if(theRescueDrillMissionCS == 1) then
			player:startEvent(0x006e);
		elseif(theRescueDrillMissionCS == 8 and player:getVar("theRescueDrillRandomNPC") == 1) then
			player:startEvent(0x0072);
		end
	end
	
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
	
	if(csid == 0x006e) then
		player:setVar("theRescueDrillMissionCS",2);
	elseif(csid == 0x0072) then
		if(player:getFreeSlotsCount() == 0) then 
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,16535); -- Bronze Sword
		else
			player:addItem(16535);
			player:messageSpecial(ITEM_OBTAINED, 16535); -- Bronze Sword
			player:setVar("theRescueDrillRandomNPC",0);
			player:setVar("theRescueDrillMissionCS",9);
		end
	end
	
end;