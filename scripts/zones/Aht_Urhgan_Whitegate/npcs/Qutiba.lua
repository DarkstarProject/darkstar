-----------------------------------
-- Area: Aht Urhgan Whitegate
-- NPC:  Qutiba
-- Type: Standard NPC
-- @pos 92.341 -7.5 -129.980 50
-----------------------------------
package.loaded["scripts/zones/Aht_Urhgan_Whitegate/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/zones/Aht_Urhgan_Whitegate/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local vanishProg = player:getVar("vanishingactCS");    
    if (player:getVar("deliveringTheGoodsCS") == 1) then
       player:startEvent(0x0028);
    elseif (player:getQuestStatus(AHT_URHGAN,DELIVERING_THE_GOODS) == QUEST_COMPLETED and vanishProg == 1) then
       player:startEvent(0x002a);
    elseif (vanishProg == 2) then
       player:startEvent(0x0036);
    elseif (vanishProg == 4 and player:hasKeyItem(RAINBOW_BERRY)) then
       player:startEvent(0x002d);
    else
       player:startEvent(0x0033);
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
     printf("CSID: %u",csid);
     printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == (0x028)) then
       player:setVar("deliveringTheGoodsCS",2);
    elseif (csid == 0x002a and option == 0) then
        player:addQuest(AHT_URHGAN,VANISHING_ACT);
        player:setVar("vanishingactCS",2);
    elseif (csid == 0x002d) then
         if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,2185);
        else
            player:setVar("vanishingactCS",0);
            player:delKeyItem(RAINBOW_BERRY);
            player:addItem(2185,1);
            player:messageSpecial(ITEM_OBTAINED,2185);
            player:completeQuest(AHT_URHGAN,VANISHING_ACT);
        end
    end
end;

