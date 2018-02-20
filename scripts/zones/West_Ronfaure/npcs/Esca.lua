-----------------------------------
-- Area: West Ronfaure
--  NPC: Esca
-- Involved in Quest "The Pickpocket"
-- !pos -624.231 -51.499 278.369 100
-----------------------------------
package.loaded["scripts/zones/West_Ronfaure/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/titles");
require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/zones/West_Ronfaure/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)

    -- "The Pickpocket" Quest status
    local thePickpocket = player:getQuestStatus(SANDORIA, THE_PICKPOCKET);

    -- "The Pickpocket" Trading Esca for Gilt Glasses
    local count = trade:getItemCount();
    local freeSlot = player:getFreeSlotsCount();
    local eagleButton = trade:hasItemQty(578, 1);
    local hasGiltGlasses = player:hasItem(579);
    if (eagleButton == true and hasGiltGlasses == false) then
        if (count == 1 and freeSlot > 0) then
            player:tradeComplete();
            player:startEvent(121);
            player:setVar("thePickpocketGiltGlasses", 1); -- used to get eventID 128
        else
            player:messageSpecial(6378, 579); -- CANNOT_OBTAIN_ITEM
        end;
    end;
end;

function onTrigger(player,npc)

    -- "The Pickpocket" Quest status
    local thePickpocket = player:getQuestStatus(SANDORIA, THE_PICKPOCKET);
    local Quotas_Status = player:getVar("ChasingQuotas_Progress");

    -- "The Pickpocket" Quest Dialog
    if (Quotas_Status == 4) then
        player:startEvent(137); -- My earring!  I stole the last dragoon's armor.  Chosen option does not matter.
    elseif (Quotas_Status == 5) then
        player:startEvent(138); -- Reminder for finding the armor.
    elseif (thePickpocket == 1 and player:getVar("thePickpocketGiltGlasses") == 1)  then
        player:startEvent(128);
    elseif (thePickpocket == 1) then
        player:startEvent(120);
    elseif (thePickpocket == 2) then
        player:startEvent(123);
    else
        player:startEvent(119);
    end;
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    -- "The Pickpocket" recieving Gilt Glasses
    if (csid == 121) then
        player:addItem(579);
        player:messageSpecial(ITEM_OBTAINED, 579);
    elseif (csid == 137) then
        player:setVar("ChasingQuotas_Progress",5);
        player:delKeyItem(SHINY_EARRING);
    end;
end;


