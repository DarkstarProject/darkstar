-----------------------------------
--  Area: Kazham
--   NPC: Vanono
--  Type: Standard NPC
-- @zone: 250
--  @pos -23.140 -5 -23.101
-- 
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Kazham/TextIDs"] = nil;
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

	if (player:getCurrentMission(WINDURST) == AWAKENING_OF_THE_GODS and player:getVar("MissionStatus") == 3) then
		player:startEvent(0x0108);
	elseif (player:getCurrentMission(WINDURST) == AWAKENING_OF_THE_GODS and player:getVar("MissionStatus") > 3) then
		player:startEvent(0x010C);
	else
		player:startEvent(0x0106);
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
	
	if (csid == 0x0108) then
		player:setVar("MissionStatus",4);
	end
	
end;

