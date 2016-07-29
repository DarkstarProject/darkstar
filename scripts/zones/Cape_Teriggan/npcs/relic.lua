-----------------------------------
-- Area: Cape Terrigan
-- NPC:  <this space intentionally left blank>
-- @pos 73 4 -174 113
-----------------------------------
package.loaded["scripts/zones/Cape_Teriggan/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Cape_Teriggan/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
   -- Working on correct relic, 4 items, Stage 4 item, Shard, Necropsyche, currencypiece
   if (player:getVar("RELIC_IN_PROGRESS") == 18347 and trade:getItemCount() == 4 and trade:hasItemQty(18347,1) and
       trade:hasItemQty(1583,1) and trade:hasItemQty(1589,1) and trade:hasItemQty(1454,1)) then
         player:startEvent(18,18348);
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
   if (csid == 18) then
      if (player:getFreeSlotsCount() < 2) then
         player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,18348);
         player:messageSpecial(FULL_INVENTORY_AFTER_TRADE,1453);
      else
         player:tradeComplete();
         player:addItem(18348);
         player:addItem(1453,30);
         player:messageSpecial(ITEM_OBTAINED,18348);
         player:messageSpecial(ITEMS_OBTAINED,1453,30);
         player:setVar("RELIC_IN_PROGRESS",0);
      end
   end
end;