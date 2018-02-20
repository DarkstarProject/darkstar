-----------------------------------
-- Area: Mhaura
--  NPC: Blandine
-- Start Quest: The Sand Charmz
-- !pos 23 -7 41 249
-----------------------------------
package.loaded["scripts/zones/Mhaura/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/zones/Mhaura/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local X = player:getXPos(); Z = player:getZPos();
    local TheSandCharm = player:getQuestStatus(OTHER_AREAS,THE_SAND_CHARM);

    if (Z <= 29 or Z >= 38 or X <= 16 or X >= 32) then
        if (player:getFameLevel(WINDURST) >= 4 and TheSandCharm == QUEST_AVAILABLE) then
            player:startEvent(125); -- Start quest "The Sand Charm"
        elseif (player:getVar("theSandCharmVar") == 2) then
            player:startEvent(124); -- During quest "The Sand Charm" - 2nd dialog
        elseif (TheSandCharm == QUEST_COMPLETED and player:getVar("SmallDialogByBlandine") == 1) then
            player:startEvent(128); -- Thanks dialog of Bladine after "The Sand Charm"
        elseif (TheSandCharm == QUEST_COMPLETED) then
            player:startEvent(129); -- New standard dialog after "The Sand Charm"
        else
            player:startEvent(122); -- Standard dialog
        end
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 125) then
        player:addQuest(OTHER_AREAS,THE_SAND_CHARM);
        player:setVar("theSandCharmVar",1);
    elseif (csid == 124) then
        player:setVar("theSandCharmVar",3);
    elseif (csid == 128) then
        player:setVar("SmallDialogByBlandine",0);
    end
end;

