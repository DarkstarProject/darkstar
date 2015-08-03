-----------------------------------
-- Area: Monastic Cavern
-- NPC:  ???
-- Used In Quest: Whence Blows the Wind 
-- @pos 168 -1 -22 150
-----------------------------------
package.loaded["scripts/zones/Monastic_Cavern/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Monastic_Cavern/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	if (player:getQuestStatus(JEUNO,WHENCE_BLOWS_THE_WIND) == QUEST_ACCEPTED and player:hasKeyItem(ORCISH_CREST) == false) then
		player:addKeyItem(ORCISH_CREST);
		player:messageSpecial(KEYITEM_OBTAINED, ORCISH_CREST);
	else
		player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
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
end;