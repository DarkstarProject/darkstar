-----------------------------------
-- Area: Western Adoulin
--  NPC: Virsaint
-- Type: Standard NPC and Quest NPC
--  Involved with Quests: 'A Certain Substitute Patrolman'
--  @zone 256
-- !pos 32 0 -5
-----------------------------------
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local ACSP = player:getQuestStatus(ADOULIN, A_CERTAIN_SUBSTITUTE_PATROLMAN);
    if ((ACSP == QUEST_ACCEPTED) and (player:getVar("ACSP_NPCs_Visited") == 4)) then
        -- Progresses Quest: 'A Certain Substitute Patrolman'
        player:startEvent(2556);
    else
        -- Standard dialogue
        player:startEvent(540);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 2556) then
        -- Progresses Quest: 'A Certain Substitute Patrolman'
        player:setVar("ACSP_NPCs_Visited", 5);
    end
end;
