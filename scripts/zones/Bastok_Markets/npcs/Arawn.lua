-----------------------------------
-- Area: Bastok Markets
-- NPC: Arawn
-- Starts & Finishes Quest: Stamp Hunt
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/titles");
require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/zones/Bastok_Markets/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    StampHunt = player:getQuestStatus(BASTOK,STAMP_HUNT);
player:startEvent(0x00e2);
    if (StampHunt ~= 2) then
        if (StampHunt == 0) then
            --player:startEvent(0x00e1);
        elseif (StampHunt == 1) then
            pavel = player:getVar("Stamp_Pavel");
            elayne = player:getVar("Stamp_Elayne");
            deadlySpider = player:getVar("Stamp_DeadlySpider");
            tallMountain = player:getVar("Stamp_TallMountain");
            romualdo = player:getVar("Stamp_Romualdo");
            ehrhard = player:getVar("Stamp_Ehrhard");
            latifah = player:getVar("Stamp_Latifah");

            if (pavel == 1  and elayne == 1 and deadlySpider == 1 and tallMountain == 1 and romualdo == 1 and ehrhard == 1 and latifah == 1) then
                --player:startEvent(0x00e2);
            else
                --player:startEvent(0x0072);
            end
        end
    else
       -- player:startEvent(0x0072);
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

    StampHunt = player:getQuestStatus("StampHunt_Event");

    if (csid == 0x00e1 and option == 0) then
        player:addQuest(BASTOK,STAMP_HUNT);
        player:addKeyItem(STAMP_SHEET);
        player:messageSpecial(KEYITEM_OBTAINED,STAMP_SHEET);
    elseif (csid == 0x00e2) then
        if (player:getFreeSlotsCount() >= 1) then
            player:completeQuest(BASTOK,STAMP_HUNT);
            player:addFame(BASTOK,BAS_FAME*50);
            player:setTitle(STAMPEDER);
            player:addItem(LEATHER_GORGET);
            player:messageSpecial(ITEM_OBTAINED, LEATHER_GORGET);
            player:delKeyItem(STAMP_SHEET);
            player:setVar("Stamp_Pavel",0);
            player:setVar("Stamp_Elayne",0);
            player:setVar("Stamp_DeadlySpider",0);
            player:setVar("Stamp_TallMountain",0);
            player:setVar("Stamp_Romualdo",0);
            player:setVar("Stamp_Ehrhard",0);
            player:setVar("Stamp_Latifah",0);
        else
           player:messageSpecial(ITEM_CANNOT_BE_OBTAINED, LEATHER_GORGET);
        end
    end
end;
