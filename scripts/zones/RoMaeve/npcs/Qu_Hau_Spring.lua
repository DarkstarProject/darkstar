-----------------------------------
-- Qu_Hau_Spring
-- Area: Ro'Maeve
-----------------------------------
package.loaded["scripts/zones/RoMaeve/TextIDs"] = nil;
require("scripts/zones/RoMaeve/TextIDs");
require("scripts/globals/quests");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
   local DMRepeat = player:getQuestStatus(OUTLANDS,DIVINE_MIGHT_REPEAT);
   local Hour = VanadielHour();

   if (player:getWeather() == 0 and IsMoonFull() == true and Hour >= 0 and Hour <= 2) then
      if ((player:getQuestStatus(OUTLANDS,DIVINE_MIGHT) == QUEST_ACCEPTED or DMRepeat == QUEST_ACCEPTED) and
         trade:hasItemQty(1408,1) and trade:hasItemQty(917,1) and trade:getItemCount() == 2) then
            player:startEvent(7,917,1408); -- Ark Pentasphere Trade
      elseif (DMRepeat == QUEST_ACCEPTED and trade:hasItemQty(1261,1) and trade:getItemCount() == 1 and
         player:hasKeyItem(MOONLIGHT_ORE) == false) then
            player:startEvent(8); -- Moonlight Ore trade
      end
   end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
end;

-----------------------------------
-- onEventSelection
-----------------------------------

function onEventUpdate(player,csid,menuchoice)
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
   if (csid == 7) then
      if (player:getFreeSlotsCount() == 0) then 
         player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,1550);
      else 
         player:addItem(1550);
         player:messageSpecial(ITEM_OBTAINED,1550);
         player:tradeComplete();
      end
   elseif (csid == 8) then
      player:tradeComplete();
      player:addKeyItem(MOONLIGHT_ORE);
      player:messageSpecial(KEYITEM_OBTAINED,MOONLIGHT_ORE);
   end
end;
