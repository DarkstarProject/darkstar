-----------------------------------
-- Area: Bastok Mines
--  NPC: Door
-- Involved in Quest: A Thief in Norg!?
-- !pos 70 7 2 234
-----------------------------------
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/quests");
require("scripts/zones/Bastok_Mines/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (player:getQuestStatus(OUTLANDS,A_THIEF_IN_NORG) == QUEST_ACCEPTED and player:getVar("aThiefinNorgCS") == 3) then
        player:startEvent(186);
        return -1;
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 186) then
        player:setVar("aThiefinNorgCS",4);
    end
end;