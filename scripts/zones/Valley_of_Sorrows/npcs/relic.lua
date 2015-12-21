-----------------------------------
-- Area: Valley of Sorrows
-- NPC:  <this space intentionally left blank>
-- @pos -14 -3 56 128
-----------------------------------
package.loaded["scripts/zones/Valley_of_Sorrows/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Valley_of_Sorrows/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
   -- Working on correct relic, 4 items, Stage 4 item, Shard, Necropsyche, currencypiece
   if (player:getVar("RELIC_IN_PROGRESS") == 18341 and trade:getItemCount() == 4 and trade:hasItemQty(18341,1) and
       trade:hasItemQty(1584,1) and trade:hasItemQty(1589,1) and trade:hasItemQty(1451,1)) then
         player:startEvent(15,18342);
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
   if (csid == 15) then
      if (player:getFreeSlotsCount() < 2) then
         player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,18342);
         player:messageSpecial(FULL_INVENTORY_AFTER_TRADE,1450);
      else
         player:tradeComplete();
         player:addItem(18342);
         player:addItem(1450,30);
         player:messageSpecial(ITEM_OBTAINED,18342);
         player:messageSpecial(ITEMS_OBTAINED,1450,30);
         player:setVar("RELIC_IN_PROGRESS",0);
      end
   end
end;