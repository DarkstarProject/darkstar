-----------------------------------
-- Area: Western Adoulin
--  NPC: Nylene
-- Type: Standard NPC and Quest NPC
--  Involved with Quest: 'A Certain Substitute Patrolman'
--  @zone 256
-- !pos 12 0 -82
-----------------------------------
require("scripts/globals/missions");
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local ACSP = player:getQuestStatus(ADOULIN, A_CERTAIN_SUBSTITUTE_PATROLMAN);
    local SOA_Mission = player:getCurrentMission(SOA);
    if (SOA_Mission >= LIFE_ON_THE_FRONTIER) then
        if ((ACSP == QUEST_ACCEPTED) and (player:getVar("ACSP_NPCs_Visited") == 7)) then
            -- Progresses Quest: 'A Certain Substitute Patrolman'
            player:startEvent(2559);
        else
            -- Standard dialogue
            player:startEvent(562);
        end
    else
        -- Dialogue prior to joining colonization effort
        player:startEvent(533);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 2559) then
        -- Progresses Quest: 'A Certain Substitute Patrolman'
        player:setVar("ACSP_NPCs_Visited", 8);
    end
end;
