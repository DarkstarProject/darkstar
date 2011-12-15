-----------------------------------
-----------------------------------
-- 	Storage Hole
-- 	for RDM AF quest, gives keyitem Orcish Dried Food
--  @zone 149
--  @pos -51 4 -217
-----------------------------------
-----------------------------------
require("scripts/globals/settings");
package.loaded["scripts/zones/Davoi/TextIDs"] = nil;
require("scripts/zones/Davoi/TextIDs");
 OrcishDriedFood = 196;
 DavoiStorageKey = 1103;
-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
if (player:getQuestStatus(0,84) == 1) and (trade:hasItemQty(DavoiStorageKey,1)) and (trade:getItemCount() == 1) then
  player:tradeComplete();
	player:messageSpecial(KEYITEM_OBTAINED,OrcishDriedFood);
	player:addKeyItem(OrcishDriedFood);
end;
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
player:messageSpecial(1001);
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
if (csid == 0x11) then
  player:setVar("peace_for_the_spirit_status",2);
elseif (csid == 0xE) then
  player:setVar("peace_for_the_spirit_status",6);
end;
end;