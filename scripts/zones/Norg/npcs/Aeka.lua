-----------------------------------
-- Area: Norg
-- NPC: Aeka
-- Involved in Quest: Forge Your Destiny
-- @zone 252
-- @pos 4 0 -4
-----------------------------------
package.loaded["scripts/zones/Norg/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/zones/Norg/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    
    questItem = player:getVar("ForgeYourDestiny_Event");
    checkItem = testflag(tonumber(questItem),0x01);    
    
    if (checkItem == true) then
        if (trade:hasItemQty(645,1) and trade:getItemCount() == 1) then
            player:startEvent(0x002f,0,1151,645); -- Oriental Steel, Darksteel Ore
        end
    end
    
end; 

-----------------------------------
-- Event Check
-----------------------------------

function testflag(set,flag)
    return (set % (2*flag) >= flag)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)    
    
    swordTimer = player:getVar("ForgeYourDestiny_timer")

    if (player:getQuestStatus(OUTLANDS,FORGE_YOUR_DESTINY) == QUEST_ACCEPTED and swordTimer == 0) then
        if (player:hasItem(1152)) then
            player:startEvent(0x0030,1152); -- Bomb Steel
        elseif (player:hasItem(1151) == false) then
            questItem = player:getVar("ForgeYourDestiny_Event");
            checkItem = testflag(tonumber(questItem),0x01);
    
            if (checkItem == false) then
                player:startEvent(0x002c,1152,1151); -- Bomb Steel, Oriental Steel
            elseif (checkItem == true) then
                player:startEvent(0x002e,0,1151,645); -- Oriental Steel, Darksteel Ore
            end
        elseif (player:hasItem(1151)) then
            player:startEvent(0x002d,1152,1151); -- Bomb Steel, Oriental Steel
        end
    elseif (swordTimer > 0) then
        player:startEvent(0x0032);
    else
        player:startEvent(0x0078);
    end
    
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
    
    questItem = player:getVar("ForgeYourDestiny_Event");
    
    if (csid == 0x002c) then
        if (player:getFreeSlotsCount(0) >= 1) then
            player:addItem(1151);
            player:messageSpecial(ITEM_OBTAINED, 1151); -- Oriental Steel
            player:setVar("ForgeYourDestiny_Event",questItem + 0x01);
        else
           player:messageSpecial(ITEM_CANNOT_BE_OBTAINED, 1151); -- Oriental Steel
        end
    elseif (csid == 0x002f) then
        if (player:getFreeSlotsCount(0) >= 1) then
            player:tradeComplete();
            player:addItem(1151);
            player:messageSpecial(ITEM_OBTAINED, 1151); -- Oriental Steel
        else
           player:messageSpecial(ITEM_CANNOT_BE_OBTAINED, 1151); -- Oriental Steel
        end
    end
    
end;