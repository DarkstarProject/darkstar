-----------------------------------
-- Area: Nashmau
--  NPC: Leleroon
-- Corsair AF2 and AF3 quests
-- !pos -14.687 0.000 25.114 53
-----------------------------------
package.loaded["scripts/zones/Nashmau/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Nashmau/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/quests");
require("scripts/globals/keyitems");
-----------------------------------

function onTrade(player,npc,trade)
    if (player:getQuestStatus(AHT_URHGAN,NAVIGATING_THE_UNFRIENDLY_SEAS) == QUEST_ACCEPTED and player:getVar("NavigatingtheUnfriendlySeas") <= 2) then
        if (trade:hasItemQty(2341,1) and trade:getItemCount() == 1) then -- Trade Hydrogauage
            player:startEvent(283);
            player:setVar("NavigatingtheUnfriendlySeas",2);
        end
    end
end;

function onTrigger(player,npc)
    if (player:getQuestStatus(AHT_URHGAN,AGAINST_ALL_ODDS) >= QUEST_ACCEPTED) then
        local letterGreen = player:getVar("LeleroonsLetterGreen");
        local letterBlue = player:getVar("LeleroonsLetterBlue");
        local letterRed = player:getVar("LeleroonsLetterRed");

        if (letterGreen >= 1 and letterGreen < 5) then
            player:startEvent(285); -- player is on green letter route
        elseif (letterBlue >= 1 and letterBlue < 5) then
            player:startEvent(286); -- player is on blue letter route
        elseif (letterRed >= 1 and letterRed < 5) then
            player:startEvent(287); -- player is on red letter route
        elseif (letterGreen < 5 or letterBlue < 5 or letterRed < 5) then
            local excludeFromMenu = 0;
            if (letterGreen == 5) then excludeFromMenu = excludeFromMenu + 2; end; -- finished green
            if (letterBlue == 5) then excludeFromMenu = excludeFromMenu + 4; end;  -- finished blue
            if (letterRed == 5) then excludeFromMenu = excludeFromMenu + 8; end;   -- finished red
            player:startEvent(282,0,0,0,0,0,0,0,excludeFromMenu);                  -- choose new route
        else
            player:startEvent(264); -- default dialog
        end;
    else
        player:startEvent(264); -- default dialog
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 282) then
        if (option == 1) then
            player:addKeyItem(LELEROONS_LETTER_GREEN);
            player:messageSpecial(KEYITEM_OBTAINED,LELEROONS_LETTER_GREEN)
            player:setVar("LeleroonsLetterGreen",1);
        elseif (option == 2) then
            player:addKeyItem(LELEROONS_LETTER_BLUE);
            player:messageSpecial(KEYITEM_OBTAINED,LELEROONS_LETTER_BLUE)
            player:setVar("LeleroonsLetterBlue",1);
        elseif (option == 3) then
            player:addKeyItem(LELEROONS_LETTER_RED);
            player:messageSpecial(KEYITEM_OBTAINED,LELEROONS_LETTER_RED)
            player:setVar("LeleroonsLetterRed",1);
        end;
    end;
end;
