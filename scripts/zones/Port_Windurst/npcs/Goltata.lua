-----------------------------------
--	Area: Port Windurst
--	NPC:  Goltata
--  Involved in Quests: Wonder Wands
--	Working 95%
--  Will play Wonder Wands csid, but will not show item name. Although it is needed to know which item, the quest itself does not require this csid.
-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/globals/titles");
package.loaded["scripts/zones/Port_Windurst/TextIDs"] = nil;
require("scripts/zones/Port_Windurst/TextIDs");
require("scripts/globals/keyitems");


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
		player:showText(npc,3676,0,17109);
	elseif(WonderWands == QUEST_COMPLETED) then
		player:startEvent(0x010d);
	else
		player:startEvent(0xe8);
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



