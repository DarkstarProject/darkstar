-----------------------------------
-- Area: Western Altepa Desert
-- NPC:  <this space intentionally left blank>
-- @pos -152 -16 20 125
-----------------------------------
package.loaded["scripts/zones/Western_Altepa_Desert/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Western_Altepa_Desert/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
   -- Working on correct relic, 4 items, Stage 4 item, Shard, Necropsyche, currencypiece
   if (player:getVar("RELIC_IN_PROGRESS") == 18287 and trade:getItemCount() == 4 and trade:hasItemQty(18287,1) and
       trade:hasItemQty(1575,1) and trade:hasItemQty(1589,1) and trade:hasItemQty(1451,1)) then
         player:startEvent(205,18288);
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
   if (csid == 205) then
      if (player:getFreeSlotsCount() < 2) then
         player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,18288);
         player:messageSpecial(FULL_INVENTORY_AFTER_TRADE,1450);
      else
         player:tradeComplete();
         player:addItem(18288);
         player:addItem(1450,30);
         player:messageSpecial(ITEM_OBTAINED,18288);
         player:messageSpecial(ITEMS_OBTAINED,1450,30);
         player:setVar("RELIC_IN_PROGRESS",0);
      end
   end
end;