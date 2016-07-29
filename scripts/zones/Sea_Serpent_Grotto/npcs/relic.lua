-----------------------------------
-- Area: Sea Serpent Grotto
-- NPC:  <this space intentionally left blank>
-- @pos -356 14 -102 176
-----------------------------------
package.loaded["scripts/zones/Sea_Serpent_Grotto/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Sea_Serpent_Grotto/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
   -- Working on correct relic, 4 items, Stage 4 item, Shard, Necropsyche, currencypiece
   if (player:getVar("RELIC_IN_PROGRESS") == 18311 and trade:getItemCount() == 4 and trade:hasItemQty(18311,1) and
       trade:hasItemQty(1579,1) and trade:hasItemQty(1589,1) and trade:hasItemQty(1457,1)) then
         player:startEvent(11,18312);
   end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
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
   if (csid == 11) then
      if (player:getFreeSlotsCount() < 2) then
         player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,18312);
         player:messageSpecial(FULL_INVENTORY_AFTER_TRADE,1456);
      else
         player:tradeComplete();
         player:addItem(18312);
         player:addItem(1456,30);
         player:messageSpecial(ITEM_OBTAINED,18312);
         player:messageSpecial(ITEMS_OBTAINED,1456,30);
         player:setVar("RELIC_IN_PROGRESS",0);
      end
   end
end;