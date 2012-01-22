-----------------------------------
-- Area: Davoi
-- NPC:  ???
-- Involved in Quest: To Cure a Cough
-- @zone 149
-- @pos 
-----------------------------------
package.loaded["scripts/zones/Davoi/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Davoi/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
<<<<<<< .mine
	
	toCureaCough = player:getQuestStatus(SANDORIA,TO_CURE_A_COUGH);
	
	if(toCureaCough == QUEST_ACCEPTED and player:hasKeyItem(THYME_MOSS) == false) then
		player:addKeyItem(THYME_MOSS);
		player:messageSpecial(KEYITEM_OBTAINED,THYME_MOSS);
	end
	
=======
	
	toCureaCough = player:getQuestStatus(SANDORIA,TO_CURE_A_COUGH);
	
	if(toCureaCough == QUEST_ACCEPTED and player:hasKeyItem(THYME_MOSS) == false) then
		player:addKeyItem(THYME_MOSS);
		player:messageSpecial(KEYITEM_OBTAINED,THYME_MOSS);
	elseif (toCureaCough == QUEST_ACCEPTED and player:hasKeyItem(THYME_MOSS) == true) then
		player:addKeyItem(THYME_MOSS);
	end
	
>>>>>>> .r531
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
