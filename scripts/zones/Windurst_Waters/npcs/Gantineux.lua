-----------------------------------
-- Area: Windurst Waters
--  NPC: Gantineux
-- Starts Quest: Acting in Good Faith
-- @zone 238
-- !pos -83 -9 3
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Windurst_Waters/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    ActingInGoodFaith = player:getQuestStatus(WINDURST,ACTING_IN_GOOD_FAITH);

    if (ActingInGoodFaith == QUEST_AVAILABLE and player:getFameLevel(WINDURST) >= 4 and player:getMainLvl() >= 10) then
        player:startEvent(10019); -- Start quest "Acting in Good Faith"
    elseif (ActingInGoodFaith == QUEST_ACCEPTED) then
        if (player:hasKeyItem(SPIRIT_INCENSE) == true) then
            player:startEvent(10020); -- During quest "Acting in Good Faith" (with Spirit Incense KI)
        elseif (player:hasKeyItem(GANTINEUXS_LETTER) == true) then
            player:startEvent(10022); --  During quest "Acting in Good Faith" (with Gantineux's Letter)
        else
            player:startEvent(10021); -- During quest "Acting in Good Faith" (before Gantineux's Letter)
        end
    elseif (ActingInGoodFaith == QUEST_COMPLETED) then
        player:startEvent(10023); -- New standard dialog after "Acting in Good Faith"
    else
        player:startEvent(10018); -- Standard dialog
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 10019 and option == 0) then
        player:addQuest(WINDURST,ACTING_IN_GOOD_FAITH);
        player:addKeyItem(SPIRIT_INCENSE);
        player:messageSpecial(KEYITEM_OBTAINED,SPIRIT_INCENSE);
    elseif (csid == 10021) then
        player:addKeyItem(GANTINEUXS_LETTER);
        player:messageSpecial(KEYITEM_OBTAINED,GANTINEUXS_LETTER);
    end
end;

