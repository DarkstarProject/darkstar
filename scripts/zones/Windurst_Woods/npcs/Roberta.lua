-----------------------------------
-- Area: Windurst Woods
--  NPC: Roberta
-- !pos 21 -4 -157 241
-----------------------------------
require("scripts/globals/settings");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local BlueRibbonBlues = player:getQuestStatus(WINDURST,BLUE_RIBBON_BLUES);
    if (BlueRibbonBlues == QUEST_ACCEPTED) then
        local blueRibbonProg = player:getVar("BlueRibbonBluesProg");

        if (blueRibbonProg >= 2 and player:hasItem(13569)) then
            player:startEvent(380);
        elseif (player:hasItem(13569)) then
            player:startEvent(379);
        elseif (player:hasItem(13569) == false) then
            if (blueRibbonProg == 1 or blueRibbonProg == 3) then
                player:startEvent(377,0,13569); -- replaces ribbon if lost
            elseif (blueRibbonProg < 1) then
                player:startEvent(376,0,13569); --gives us ribbon
            end
        else
            player:startEvent(436);
        end

    else
        player:startEvent(436);
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 376 and option == 1 or csid == 377 and option == 1) then
        if (player:getFreeSlotsCount() >= 1) then
            local blueRibbonProg = player:getVar("BlueRibbonBluesProg");
            if (blueRibbonProg < 1) then
                player:setVar("BlueRibbonBluesProg",1);
            elseif (blueRibbonProg == 3) then
                player:setVar("BlueRibbonBluesProg",4);
            end
            player:addItem(13569);
            player:messageSpecial(ITEM_OBTAINED,13569);
        else
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,13569);
        end
    end
end;



