-----------------------------------
--  Area: Davoi
--  NPC:  Lootblox
--  Type: Standard NPC
--  @pos 218.073 -0.982 -20.746 149
-----------------------------------
package.loaded["scripts/zones/Davoi/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Davoi/TextIDs");
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
         player:startEvent(134);
      elseif (gil == 0) then
         if (count == 1 and trade:hasItemQty(4236,1)) then -- Bringing back a Timeless Hourglass
            player:startEvent(153);

         -- Currency Exchanges
         elseif (count == CURRENCY_EXCHANGE_RATE and trade:hasItemQty(1452,CURRENCY_EXCHANGE_RATE)) then -- Single -> Hundred
            player:startEvent(135,CURRENCY_EXCHANGE_RATE);
         elseif (count == CURRENCY_EXCHANGE_RATE and trade:hasItemQty(1453,CURRENCY_EXCHANGE_RATE)) then -- Hundred -> Ten thousand
            player:startEvent(136,CURRENCY_EXCHANGE_RATE);
         elseif (count == 1 and trade:hasItemQty(1454,1)) then -- Ten thousand -> 100 Hundreds
            player:startEvent(138,1454,1453,CURRENCY_EXCHANGE_RATE);

         -- Currency Shop
         elseif (count == 25 and trade:hasItemQty(1453,25)) then -- Behemoth Horn (833)
            buying = true;
            exchange = {25, 833};
         elseif (count == 7 and trade:hasItemQty(1453,7)) then -- Goblin Grease (1520)
            buying = true;
            exchange = {7,1520};
         elseif (count == 8 and trade:hasItemQty(1453,8)) then -- Griffon Hide (1516)
            buying = true;
            exchange = {8, 1516};
         elseif (count == 23 and trade:hasItemQty(1453,23)) then -- Griffon Leather (1459)
            buying = true;
            exchange = {23, 1459};
         elseif (count == 28 and trade:hasItemQty(1453,28)) then -- Mammoth Tusk (1458)
            buying = true;
            exchange = {28,1458};
         elseif (count == 6 and trade:hasItemQty(1453,6)) then -- Relic Iron (1466)
            buying = true;
            exchange = {6, 1466};
         elseif (count == 5 and trade:hasItemQty(1453,5)) then -- Twincoon (1295)
            buying = true;
            exchange = {5, 1295};
         end
      end
   end

   -- Handle the shop trades.
   -- Item obtained dialog appears before CS.  Could be fixed with a non-local variable and onEventFinish, but meh.
   if (buying == true) then
      if (player:getFreeSlotsCount() == 0) then
         player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,exchange[2]);
      else
         player:startEvent(137,1453,exchange[1],exchange[2]);
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
   --if (player:hasKeyItem(VIAL_OF_SHROUDED_SAND) == true) then
      player:startEvent(133, 1452, CURRENCY_EXCHANGE_RATE, 1453, CURRENCY_EXCHANGE_RATE, 1454, TIMELESS_HOURGLASS_COST, 4236, TIMELESS_HOURGLASS_COST);
   --[[else
      player:startEvent(130);
   end]]
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
         player:updateEvent(1454, 1453, CURRENCY_EXCHANGE_RATE);

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
         player:updateEvent(25,883,7,1520,8,1516,23,1459);
      elseif (option == 3) then -- Hundreds sales menu Page 2 (price1 item1 price2 item2 price3 item3)
         player:updateEvent(28,1458,6,1466,5,1295);
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
         player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,1453);
      else
         player:tradeComplete();
         player:addItem(1453);
         player:messageSpecial(ITEM_OBTAINED,1453);
      end
   elseif (csid == 136) then -- Trading 100 Hundreds for Ten thousand
      if (player:getFreeSlotsCount() == 0) then
         player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,1454);
      else
         player:tradeComplete();
         player:addItem(1454);
         player:messageSpecial(ITEM_OBTAINED,1454);
      end
   elseif (csid == 138) then -- Trading Ten thousand for 100 Hundreds
      if (player:getFreeSlotsCount() <= 1) then
         player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,1453);
      else
         player:tradeComplete();
         player:addItem(1453,CURRENCY_EXCHANGE_RATE);
         if (CURRENCY_EXCHANGE_RATE >= 100) then -- Turns out addItem cannot add > stackSize, so we need to addItem twice for quantities > 99.
            player:addItem(1453,CURRENCY_EXCHANGE_RATE - 99);
         end
         player:messageSpecial(ITEMS_OBTAINED,1453,CURRENCY_EXCHANGE_RATE);
      end
   end
end;