-----------------------------------
-- Area: Metalworks
-- NPC:  <this space intentionally left blank>
-- @pos -20 -11 33 237
-----------------------------------
package.loaded["scripts/zones/Metalworks/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Metalworks/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
   -- Working on correct relic, 4 items, Stage 4 item, Shard, Necropsyche, currencypiece
   if (player:getVar("RELIC_IN_PROGRESS") == 18335 and trade:getItemCount() == 4 and trade:hasItemQty(18335,1) and
       trade:hasItemQty(1585,1) and trade:hasItemQty(1589,1) and trade:hasItemQty(1457,1)) then
         player:startEvent(843,18336);
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
   if (csid == 843) then
      if (player:getFreeSlotsCount() < 2) then
         player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,18336);
         player:messageSpecial(FULL_INVENTORY_AFTER_TRADE,1456);
      else
         player:tradeComplete();
         player:addItem(18336);
         player:addItem(1456,30);
         player:messageSpecial(ITEM_OBTAINED,18336);
         player:messageSpecial(ITEMS_OBTAINED,1456,30);
         player:setVar("RELIC_IN_PROGRESS",0);
      end
   end
end;