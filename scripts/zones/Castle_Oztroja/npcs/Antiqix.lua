-----------------------------------
--  Area: Castle Oztroja
--  NPC:  Antiqix
--  Type: Dynamis Vendor
--  @pos -207.835 -0.751 -25.498 151
-----------------------------------
package.loaded["scripts/zones/Castle_Oztroja/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Castle_Oztroja/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/dynamis");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
   local count = trade:getItemCount();
   local buying = false;
   local exchange;
   local gil = trade:getGil();

   if (player:hasKeyItem(VIAL_OF_SHROUDED_SAND) == true) then
      if (count == 1 and gil == TIMELESS_HOURGLASS_COST) then -- Hourglass purchase
         player:startEvent(54);
      elseif (gil == 0) then
         if (count == 1 and trade:hasItemQty(4236,1)) then -- Bringing back a Timeless Hourglass
            player:startEvent(97);

         -- Currency Exchanges
         elseif (count == CURRENCY_EXCHANGE_RATE and trade:hasItemQty(1449,CURRENCY_EXCHANGE_RATE)) then -- Single -> Hundred
            player:startEvent(55,CURRENCY_EXCHANGE_RATE);
         elseif (count == CURRENCY_EXCHANGE_RATE and trade:hasItemQty(1450,CURRENCY_EXCHANGE_RATE)) then -- Hundred -> Ten thousand
            player:startEvent(56,CURRENCY_EXCHANGE_RATE);
         elseif (count == 1 and trade:hasItemQty(1451,1)) then -- Ten thousand -> 100 Hundreds
            player:startEvent(58,1451,1450,CURRENCY_EXCHANGE_RATE);

         -- Currency Shop
         elseif (count == 7 and trade:hasItemQty(1450,7)) then -- Angel Skin (1312)
            buying = true;
            exchange = {7, 1312};
         elseif (count == 23 and trade:hasItemQty(1450,23)) then -- Chronos Tooth (1463)
            buying = true;
            exchange = {23,1463};
         elseif (count == 8 and trade:hasItemQty(1450,8)) then -- Colossal Skull (1518)
            buying = true;
            exchange = {8, 1518};
         elseif (count == 28 and trade:hasItemQty(1450,28)) then -- Damascus Ingot (658)
            buying = true;
            exchange = {28, 658};
         elseif (count == 9 and trade:hasItemQty(1450,9)) then -- Lancewood Log (1464)
            buying = true;
            exchange = {9, 1464};
         elseif (count == 25 and trade:hasItemQty(1450,25)) then -- Lancewood Lumber (1462)
            buying = true;
            exchange = {25, 1462};
         elseif (count == 24 and trade:hasItemQty(1450,24)) then -- Relic Steel (1467)
            buying = true;
            exchange = {24, 1467};
         end
      end
   end

   -- Handle the shop trades.
   -- Item obtained dialog appears before CS.  Could be fixed with a non-local variable and onEventFinish, but meh.
   if (buying == true) then
      if (player:getFreeSlotsCount() == 0) then
         player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,exchange[2]);
      else
         player:startEvent(57,1450,exchange[1],exchange[2]);
         player:tradeComplete();
         player:addItem(exchange[2]);
         player:messageSpecial(ITEM_OBTAINED,exchange[2]);
      end
   end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
   if (player:hasKeyItem(VIAL_OF_SHROUDED_SAND) == true) then
      player:startEvent(53, 1449, CURRENCY_EXCHANGE_RATE, 1450, CURRENCY_EXCHANGE_RATE, 1451, TIMELESS_HOURGLASS_COST, 4236, TIMELESS_HOURGLASS_COST);
   else
      player:startEvent(50);
   end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
   -- printf("Update CSID: %u",csid);
   -- printf("Update RESULT: %u",option);
   if (csid == 53) then
      if (option == 11) then -- Main menu, and many others.  Param1 = map bitmask, param2 = player's gil
         player:updateEvent(getDynamisMapList(player), player:getGil());
      elseif (option == 10) then -- Final line of the ancient currency explanation.  "I'll trade you param3 param2s for a param1."
         player:updateEvent(1451, 1450, CURRENCY_EXCHANGE_RATE);

      -- Map sales handling.
      elseif (option >= MAP_OF_DYNAMIS_SANDORIA and option <= MAP_OF_DYNAMIS_TAVNAZIA) then
         -- The returned option is actually the keyitem ID, making this much easier.
         -- The prices are set in the menu's dialog, so they cannot be (visibly) changed.
         if (option == MAP_OF_DYNAMIS_BEAUCEDINE) then -- 15k gil
            player:delGil(15000);
         elseif (option == MAP_OF_DYNAMIS_XARCABARD or option == MAP_OF_DYNAMIS_TAVNAZIA) then -- 20k gil
            player:delGil(20000);
         else -- All others 10k
            player:delGil(10000);
         end
         player:addKeyItem(option);
         player:updateEvent(getDynamisMapList(player),player:getGil());

      -- Ancient Currency shop menu
      elseif (option == 2) then -- Hundreds sales menu Page 1 (price1 item1 price2 item2 price3 item3 price4 item4)
         player:updateEvent(7,1312,23,1463,8,1518,28,658);
      elseif (option == 3) then -- Hundreds sales menu Page 2 (price1 item1 price2 item2 price3 item3)
         player:updateEvent(9,1464,25,1462,24,1467);
      end
   end
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
   -- printf("Finish CSID: %u",csid);
   -- printf("Finish RESULT: %u",option);

   if (csid == 54) then -- Buying an Hourglass
      if (player:getFreeSlotsCount() == 0 or player:hasItem(4236) == true) then
         player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,4236);
      else
         player:tradeComplete();
         player:addItem(4236);
         player:messageSpecial(ITEM_OBTAINED,4236);
      end
   elseif (csid == 97) then -- Bringing back an hourglass for gil.
      player:tradeComplete();
      player:addGil(TIMELESS_HOURGLASS_COST);
      player:messageSpecial(GIL_OBTAINED,TIMELESS_HOURGLASS_COST);
   elseif (csid == 55) then -- Trading Singles for a Hundred
      if (player:getFreeSlotsCount() == 0) then
         player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,1450);
      else
         player:tradeComplete();
         player:addItem(1450);
         player:messageSpecial(ITEM_OBTAINED,1450);
      end
   elseif (csid == 56) then -- Trading 100 Hundreds for Ten thousand
      if (player:getFreeSlotsCount() == 0) then
         player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,1451);
      else
         player:tradeComplete();
         player:addItem(1451);
         player:messageSpecial(ITEM_OBTAINED,1451);
      end
   elseif (csid == 58) then -- Trading Ten thousand for 100 Hundreds
      if (player:getFreeSlotsCount() <= 1) then
         player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,1450);
      else
         player:tradeComplete();
         player:addItem(1450,CURRENCY_EXCHANGE_RATE);
         if (CURRENCY_EXCHANGE_RATE >= 100) then -- Turns out addItem cannot add > stackSize, so we need to addItem twice for quantities > 99.
            player:addItem(1450,CURRENCY_EXCHANGE_RATE - 99);
         end
         player:messageSpecial(ITEMS_OBTAINED,1450,CURRENCY_EXCHANGE_RATE);
      end
   end
end;