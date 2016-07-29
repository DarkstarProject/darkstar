-----------------------------------
-- Area: The Sanctuary of Zi'Tah
-- NPC:  <this space intentionally left blank>
-- @pos 646 -2 -165 121
-- @pos -18 0 55 121
-----------------------------------
package.loaded["scripts/zones/The_Sanctuary_of_ZiTah/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/The_Sanctuary_of_ZiTah/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
   local count = trade:getItemCount();
   local currentRelic = player:getVar("RELIC_IN_PROGRESS");

   -- Working on correct relic, 4 items, Stage 4 item, Shard, Necropsyche, currencypiece
   -- Zi'tah has two different relics in it, both with the same NPC name, and therefore one script.
   -- Mandau
   if (currentRelic == 18269 and count == 4 and trade:hasItemQty(18269,1) and trade:hasItemQty(1572,1) and
       trade:hasItemQty(1589,1) and trade:hasItemQty(1457,1)) then
         player:startEvent(207,18270);

   -- Mjollnir
   elseif (currentRelic == 18323 and count == 4 and trade:hasItemQty(18323,1) and trade:hasItemQty(1581,1) and
           trade:hasItemQty(1589,1) and trade:hasItemQty(1454,1)) then
         player:startEvent(216,18324);
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
   if (csid == 207) then
      if (player:getFreeSlotsCount() < 2) then
         player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,18270);
         player:messageSpecial(FULL_INVENTORY_AFTER_TRADE,1456);
      else
         player:tradeComplete();
         player:addItem(18270);
         player:addItem(1456,30);
         player:messageSpecial(ITEM_OBTAINED,18270);
         player:messageSpecial(ITEMS_OBTAINED,1456,30);
         player:setVar("RELIC_IN_PROGRESS",0);
      end
   elseif (csid == 216) then
      if (player:getFreeSlotsCount() < 2) then
         player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,18324);
         player:messageSpecial(FULL_INVENTORY_AFTER_TRADE,1453);
      else
         player:tradeComplete();
         player:addItem(18324);
         player:addItem(1453,30);
         player:messageSpecial(ITEM_OBTAINED,18324);
         player:messageSpecial(ITEMS_OBTAINED,1453,30);
         player:setVar("RELIC_IN_PROGRESS",0);
      end
   end
end;