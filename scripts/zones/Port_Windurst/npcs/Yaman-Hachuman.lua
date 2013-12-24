-----------------------------------
--  Area: Port Windurst
--   NPC: Yaman-Hachuman
--  Type: Standard NPC
-- @zone: 240
--  @pos -101.209 -4.25 110.886
--  Involved in Quests: Wonder Wands
-----------------------------------
package.loaded["scripts/zones/Port_Windurst/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/zones/Port_Windurst/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
WonderWands = player:getQuestStatus(WINDURST,WONDER_WANDS);
	if(WonderWands == QUEST_ACCEPTED) then
		player:startEvent(0x0100,0,0,0,17061);
	elseif(WonderWands == QUEST_COMPLETED) then
		player:startEvent(0x010c);
	else
		player:startEvent(0xe9);
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
end;

