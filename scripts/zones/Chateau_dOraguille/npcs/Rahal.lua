-----------------------------------
-- Area: Chateau d'Oraguille
-- NPC:  Rahal
-- Involved in Quests: The Holy Crest
-- @zone 233
-- @pos -28 0 -6
-----------------------------------
package.loaded["scripts/zones/Chateau_dOraguille/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/zones/Chateau_dOraguille/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	if (player:getVar("TheHolyCrest_Event") == 5 and player:hasKeyItem(DRAGON_CURSE_REMEDY) == false) then
		player:startEvent(0x003c);
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

	if (csid == 0x003c) then
		player:addKeyItem(DRAGON_CURSE_REMEDY);
		player:messageSpecial(KEYITEM_OBTAINED, DRAGON_CURSE_REMEDY);
	end
	
end;