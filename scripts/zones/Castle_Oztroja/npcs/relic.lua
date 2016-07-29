-----------------------------------
-- Area: Castle Oztroja
-- NPC:  <this space intentionally left blank>
-- @pos -104 -73 85 151
-----------------------------------
package.loaded["scripts/zones/Castle_Oztroja/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Castle_Oztroja/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
   -- Working on correct relic, 4 items, Stage 4 item, Shard, Necropsyche, currencypiece
   if (player:getVar("RELIC_IN_PROGRESS") == 18263 and trade:getItemCount() == 4 and trade:hasItemQty(18263,1) and
       trade:hasItemQty(1571,1) and trade:hasItemQty(1589,1) and trade:hasItemQty(1457,1)) then
         player:startEvent(59,18264);
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
   if (csid == 59) then
      if (player:getFreeSlotsCount() < 2) then
         player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,18264);
         player:messageSpecial(FULL_INVENTORY_AFTER_TRADE,1456);
      else
         player:tradeComplete();
         player:addItem(18264);
         player:addItem(1456,30);
         player:messageSpecial(ITEM_OBTAINED,18264);
         player:messageSpecial(ITEMS_OBTAINED,1456,30);
         player:setVar("RELIC_IN_PROGRESS",0);
      end
   end
end;