-----------------------------------
--  Area: Beadeaux
--  NPC:  Haggleblix
--  Type: Dynamis NPC
--  @pos -255.847 0.595 106.485 147
-----------------------------------
package.loaded["scripts/zones/Beadeaux/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/dynamis");
require("scripts/zones/Beadeaux/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
   local count = trade:getItemCount();
   local buying = false;
   local exchange;
   local gil = trade:getGil();

   if (player:hasKeyItem(VIAL_OF_SHROUDED_SAND)) then
      if (count == 1 and gil == TIMELESS_HOURGLASS_COST) then -- Hourglass purchase
         player:startEvent(134);
      elseif (gil == 0) then
         if (count == 1 and trade:hasItemQty(4236,1)) then -- Bringing back a Timeless Hourglass
            player:startEvent(153);

         -- Currency Exchanges
         elseif (count == CURRENCY_EXCHANGE_RATE and trade:hasItemQty(1455,CURRENCY_EXCHANGE_RATE)) then -- Single -> Hundred
            player:startEvent(135,CURRENCY_EXCHANGE_RATE);
         elseif (count == CURRENCY_EXCHANGE_RATE and trade:hasItemQty(1456,CURRENCY_EXCHANGE_RATE)) then -- Hundred -> Ten thousand
            player:startEvent(136,CURRENCY_EXCHANGE_RATE);
         elseif (count == 1 and trade:hasItemQty(1457,1)) then -- Ten thousand -> 100 Hundreds
            player:startEvent(138,1457,1456,CURRENCY_EXCHANGE_RATE);

         -- Currency Shop
         elseif (count == 12 and trade:hasItemQty(1456,12)) then -- Cantarella (4246)
            buying = true;
            exchange = {12, 4246};
         elseif (count == 33 and trade:hasItemQty(1456,33)) then -- Koh-I-Noor (1460)
            buying = true;
            exchange = {33,1460};
         elseif (count == 20 and trade:hasItemQty(1456,20)) then -- Marksman's Oil (1468)
            buying = true;
            exchange = {20, 1468};
         elseif (count == 7 and trade:hasItemQty(1456,7)) then -- Siren's Hair (1313)
            buying = true;
            exchange = {7, 1313};
         elseif (count == 8 and trade:hasItemQty(1456,8)) then -- Slime Juice (1521)
            buying = true;
            exchange = {8,1521};
         elseif (count == 25 and trade:hasItemQty(1456,25)) then -- Wootz Ingot (1461)
            buying = true;
            exchange = {25, 1461};
         elseif (count == 9 and trade:hasItemQty(1456,9)) then -- Wootz Ore (1469)
            buying = true;
            exchange = {9, 1469};
         end
      end
   end

   -- Handle the shop trades.
   -- Item obtained dialog appears before CS.  Could be fixed with a non-local variable and onEventFinish, but meh.
   if (buying == true) then
      if (player:getFreeSlotsCount() == 0) then
         player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,exchange[2]);
      else
         player:startEvent(137,1456,exchange[1],exchange[2]);
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
      player:startEvent(133, 1455, CURRENCY_EXCHANGE_RATE, 1456, CURRENCY_EXCHANGE_RATE, 1457, TIMELESS_HOURGLASS_COST, 4236, TIMELESS_HOURGLASS_COST);
   else
      player:startEvent(130);
   end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

   if (csid == 133) then
      if (option == 11) then -- Main menu, and many others.  Param1 = map bitmask, param2 = player's gil
         player:updateEvent(getDynamisMapList(player), player:getGil());
      elseif (option == 10) then -- Final line of the ancient currency explanation.  "I'll trade you param3 param2s for a param1."
         player:updateEvent(1457, 1456, CURRENCY_EXCHANGE_RATE);

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
         player:updateEvent(12,4246,33,1460,20,1468,7,1313);
      elseif (option == 3) then -- Hundreds sales menu Page 2 (price1 item1 price2 item2 price3 item3)
         player:updateEvent(8,1521,25,1461,9,1469);
      end
   end
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

   if (csid == 134) then -- Buying an Hourglass
      if (player:getFreeSlotsCount() == 0 or player:hasItem(4236) == true) then
         player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,4236);
      else
         player:tradeComplete();
         player:addItem(4236);
         player:messageSpecial(ITEM_OBTAINED,4236);
      end
   elseif (csid == 153) then -- Bringing back an hourglass for gil.
      player:tradeComplete();
      player:addGil(TIMELESS_HOURGLASS_COST);
      player:messageSpecial(GIL_OBTAINED,TIMELESS_HOURGLASS_COST);
   elseif (csid == 135) then -- Trading Singles for a Hundred
      if (player:getFreeSlotsCount() == 0) then
         player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,1456);
      else
         player:tradeComplete();
         player:addItem(1456);
         player:messageSpecial(ITEM_OBTAINED,1456);
      end
   elseif (csid == 136) then -- Trading 100 Hundreds for Ten thousand
      if (player:getFreeSlotsCount() == 0) then
         player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,1457);
      else
         player:tradeComplete();
         player:addItem(1457);
         player:messageSpecial(ITEM_OBTAINED,1457);
      end
   elseif (csid == 138) then -- Trading Ten thousand for 100 Hundreds
      if (player:getFreeSlotsCount() <= 1) then
         player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,1456);
      else
         player:tradeComplete();
         player:addItem(1456,CURRENCY_EXCHANGE_RATE);
         if (CURRENCY_EXCHANGE_RATE >= 100) then -- Turns out addItem cannot add > stackSize, so we need to addItem twice for quantities > 99.
            player:addItem(1456,CURRENCY_EXCHANGE_RATE - 99);
         end
         player:messageSpecial(ITEMS_OBTAINED,1456,CURRENCY_EXCHANGE_RATE);
      end
   end
end;