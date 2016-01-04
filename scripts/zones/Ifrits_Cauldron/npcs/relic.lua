-----------------------------------
-- Area: Ifrit's Cauldron
-- NPC:  <this space intentionally left blank>
-- @pos -18 40 20 205
-----------------------------------
package.loaded["scripts/zones/Ifrits_Cauldron/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Ifrits_Cauldron/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
   -- Working on correct relic, 4 items, Stage 4 item, Shard, Necropsyche, currencypiece
   if (player:getVar("RELIC_IN_PROGRESS") == 18329 and trade:getItemCount() == 4 and trade:hasItemQty(18329,1) and
       trade:hasItemQty(1582,1) and trade:hasItemQty(1589,1) and trade:hasItemQty(1451,1)) then
         player:startEvent(32,18330);
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
   if (csid == 32) then
      if (player:getFreeSlotsCount() < 2) then
         player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,18330);
         player:messageSpecial(FULL_INVENTORY_AFTER_TRADE,1450);
      else
         player:tradeComplete();
         player:addItem(18330);
         player:addItem(1450,30);
         player:messageSpecial(ITEM_OBTAINED,18330);
         player:messageSpecial(ITEMS_OBTAINED,1450,30);
         player:setVar("RELIC_IN_PROGRESS",0);
      end
   end
end;