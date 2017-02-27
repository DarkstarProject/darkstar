-----------------------------------
--  Area: Western Adoulin
--  NPC: Clemmar
--  Type: Standard NPC and Quest NPC
--  Involved with Quest: 'A Certain Substitute Patrolman'
--  @zone 256
-- @pos -12 0 12
-----------------------------------
require("scripts/globals/missions");
require("scripts/globals/quests");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local ACSP = player:getQuestStatus(ADOULIN, A_CERTAIN_SUBSTITUTE_PATROLMAN);
    local SOA_Mission = player:getCurrentMission(SOA);
    if (SOA_Mission >= LIFE_ON_THE_FRONTIER) then
        if ((ACSP == QUEST_ACCEPTED) and (player:getVar("ACSP_NPCs_Visited") == 2)) then
            -- Progresses Quest: 'A Certain Substitute Patrolman'
            player:startEvent(0x09FA);
        else
            -- Standard dialogue
            player:startEvent(0x023A);
        end
    else
        -- Dialogue prior to joining colonization effort
        player:startEvent(0x0207);
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    if (csid == 0x09FA) then
        -- Progresses Quest: 'A Certain Substitute Patrolman'
        player:setVar("ACSP_NPCs_Visited", 3);
    end
end;
