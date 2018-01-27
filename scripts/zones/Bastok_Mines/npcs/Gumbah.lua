-----------------------------------
-- Area: Bastok Mines
--  NPC: Gumbah
-- Finishes Quest: Blade of Darkness
-----------------------------------
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Bastok_Mines/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    local bladeDarkness = player:getQuestStatus(BASTOK, BLADE_OF_DARKNESS);

    if (player:getMainLvl() >= ADVANCED_JOB_LEVEL and  bladeDarkness == QUEST_AVAILABLE) then
        --DARK KNIGHT QUEST
        player:startEvent(99);
    elseif (bladeDarkness == QUEST_COMPLETED and player:getQuestStatus(BASTOK,BLADE_OF_DEATH) == QUEST_AVAILABLE) then
        player:startEvent(130);
    elseif ((player:hasCompletedMission(BASTOK, ON_MY_WAY) == true)
    or ((player:getCurrentMission(BASTOK) == ON_MY_WAY) and (player:getVar("MissionStatus") == 3)))
        and (player:getVar("[B7-2]Werei") == 0) then
        player:startEvent(177);
    else
        --DEFAULT
        player:startEvent(52);
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 99) then
        player:addQuest(BASTOK, BLADE_OF_DARKNESS);
    elseif (csid == 130) then
        player:addQuest(BASTOK, BLADE_OF_DEATH);
        player:addKeyItem(LETTER_FROM_ZEID);
        player:messageSpecial(KEYITEM_OBTAINED,LETTER_FROM_ZEID);
    elseif (csid == 177) then
        player:setVar("[B7-2]Werei", 1);
    end
end;