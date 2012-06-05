-----------------------------------
-- Area: Norg
-- NPC: Shivivi
-- Starts Quest: Secret of the Damp Scroll
-- @zone 252
-- @pos 68.729 -6.281 -6.432
-----------------------------------
package.loaded["scripts/zones/Norg/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Norg/TextIDs");
-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	DampScroll = player:getQuestStatus(OUTLANDS,SECRET_OF_THE_DAMP_SCROLL);
	mLvl = player:getMainLvl();
	
	if(DampScroll == QUEST_AVAILABLE and player:getFameLevel(NORG) >= 3 and mLvl >= 10 and player:hasItem(1210) == true) then
		player:startEvent(0x001f,1210); -- Start the quest
	elseif(DampScroll == QUEST_ACCEPTED) then
		player:startEvent(0x0020); -- Reminder Dialogue
	else
		player:startEvent(0x0055);
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
	if(csid == 0x001f) then
		player:addQuest(OUTLANDS,SECRET_OF_THE_DAMP_SCROLL);
	end
end;



