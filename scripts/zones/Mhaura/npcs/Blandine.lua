-----------------------------------
-- Area: Mhaura
-- NPC:  Blandine
-- Start Quest: The Sand Charm
-- @zone 249
-- @pos 23 -7 41
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
package.loaded["scripts/zones/Mhaura/TextIDs"] = nil;
require("scripts/zones/Mhaura/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	X = player:getXPos(); Z = player:getZPos();
	TheSandCharm = player:getQuestStatus(OTHER_AREAS,THE_SAND_CHARM);
	
	if(Z <= 29 or Z >= 38 or X <= 16 or X >= 32) then
		if(player:getFameLevel(WINDURST) >= 4 and TheSandCharm == QUEST_AVAILABLE) then 
			player:startEvent(0x007d); -- Start quest "The Sand Charm"
		elseif(player:getVar("theSandCharmVar") == 2) then 
			player:startEvent(0x007c); -- During quest "The Sand Charm" - 2nd dialog
		elseif(TheSandCharm == QUEST_COMPLETED and player:getVar("SmallDialogByBlandine") == 1) then 
			player:startEvent(0x0080); -- Thanks dialog of Bladine after "The Sand Charm"
		elseif(TheSandCharm == QUEST_COMPLETED) then
			player:startEvent(0x0081); -- New standard dialog after "The Sand Charm"
		else
			player:startEvent(0x007a); -- Standard dialog
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
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
	if(csid == 0x007d) then
		player:addQuest(OTHER_AREAS,THE_SAND_CHARM);
		player:setVar("theSandCharmVar",1);
	elseif(csid == 0x007c) then
		player:setVar("theSandCharmVar",3);
	elseif(csid == 0x0080) then 
		player:setVar("SmallDialogByBlandine",0);
	end
end;



