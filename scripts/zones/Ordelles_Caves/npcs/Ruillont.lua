-----------------------------------
-- Area: Ordelles Caves
-- NPC:  Ruillont
-- Involved in Mission: The Rescue Drill
-- @zone 193
-- @pos -70 1 607
-----------------------------------

require("scripts/globals/missions");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	if(player:getCurrentMission(SANDORIA) == THE_RESCUE_DRILL and player:getVar("theRescueDrillMissionCS") == 9) then
		if(trade:hasItemQty(16535,1) and trade:getItemCount() == 1) then -- Trade Bronze Sword
			player:startEvent(0x0002);
		end
	end
	
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	if(player:getCurrentMission(SANDORIA) == THE_RESCUE_DRILL and player:getVar("theRescueDrillMissionCS") == 7) then
		player:startEvent(0x0001);
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
	
	if(csid == 0x0001) then
		rand = math.random(1,2);
		rand = math.random(1,2);
		rand = math.random(1,2);
		
		player:setVar("theRescueDrillRandomNPC",rand);
		player:setVar("theRescueDrillMissionCS",8);
	elseif(csid == 0x0002) then
		player:tradeComplete();
		player:setVar("theRescueDrillMissionCS",10);
	end
	
end;