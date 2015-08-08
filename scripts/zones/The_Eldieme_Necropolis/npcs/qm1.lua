-----------------------------------
-- Area: The Eldieme Necropolis
-- NPC:  ???
-- Involved in Quests: Acting in Good Faith
-- @zone 195
-- @pos -17 0 59 (I-10)
-- @pos 
-- @pos 
-- @pos 
-----------------------------------
package.loaded["scripts/zones/The_Eldieme_Necropolis/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/The_Eldieme_Necropolis/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	local ActingInGoodFaith = player:getQuestStatus(WINDURST,ACTING_IN_GOOD_FAITH);
	
	if (ActingInGoodFaith == QUEST_ACCEPTED and player:hasKeyItem(SPIRIT_INCENSE) == true) then
		player:startEvent(0x0032);
	else
		player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
	end
end;
-- 
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
	if (csid == 0x0032 and option == 0) then 
		player:messageSpecial(SPIRIT_INCENSE_EMITS_PUTRID_ODOR,SPIRIT_INCENSE);
		player:delKeyItem(SPIRIT_INCENSE);
	end
end;