-----------------------------------
--  Area: Jugner Forest
--  NPC: Alexius
--  Involved in Quest: A purchase of Arms & Sin Hunting
--  @zone 104
--  @pos  105 1 382
-----------------------------------
package.loaded["scripts/zones/Jugner_Forest/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/zones/Jugner_Forest/TextIDs");

-----------------------------------
-- onTrade
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger
-----------------------------------

function onTrigger(player,npc)
   
	if (player:hasKeyItem(WEAPONS_ORDER) == true) then
		player:startEvent(0x0005);
	else
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
   if(csid == 0x0005) then
      player:delKeyItem(WEAPONS_ORDER);
      player:addKeyItem(WEAPONS_RECEIPT);
      player:messageSpecial(KEYITEM_OBTAINED,WEAPONS_RECEIPT);
   end
end;