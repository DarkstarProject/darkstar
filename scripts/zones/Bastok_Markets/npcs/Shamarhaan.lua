-----------------------------------
-- Area: Bastok Markets
--  NPC: Shamarhaan
-- Type: Quest Starter
-- Involved in quest: No Strings Attached
-- !pos -285.382 -13.021 -84.743 235
-----------------------------------
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Bastok_Markets/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local NoStringsAttached = player:getQuestStatus(AHT_URHGAN,NO_STRINGS_ATTACHED);
    local NoStringsAttachedProgress = player:getVar("NoStringsAttachedProgress");

    if (player:getMainLvl() >= ADVANCED_JOB_LEVEL and NoStringsAttached == QUEST_AVAILABLE) then
        player:startEvent(434); -- initial cs to start the quest, go and see Iruki-Waraki at Whitegate
    elseif (NoStringsAttachedProgress == 1) then
        player:startEvent(435); -- reminder to go see Iruki-Waraki at Whitegate
    else
        player:startEvent(433);
    end;
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 434) then
        player:setVar("NoStringsAttachedProgress",1);
        player:addQuest(AHT_URHGAN,NO_STRINGS_ATTACHED);
    end;
end;
