-----------------------------------
-- Area: Windurst Waters
--  NPC: Alter Of Offering
-- Involved in Quest: A Crisis in the Making
-- !pos -137 17 177 145
-----------------------------------
package.loaded["scripts/zones/Giddeus/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Giddeus/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/globals/titles");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    crisisstatus = player:getQuestStatus(WINDURST,A_CRISIS_IN_THE_MAKING);
    if (crisisstatus >= 1 and player:getVar("QuestCrisisMaking_var") == 1) then
        player:startEvent(53); -- A Crisis in the Making: Receive Offering
    else
        player:startEvent(60); -- Standard Message
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 53 and option == 1) then
        player:addKeyItem(39,OFF_OFFERING);
        player:messageSpecial(KEYITEM_OBTAINED,OFF_OFFERING);
        player:setVar("QuestCrisisMaking_var",2);
    end
end;
