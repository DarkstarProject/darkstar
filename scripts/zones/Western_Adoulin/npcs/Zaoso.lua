-----------------------------------
--  Area: Western Adoulin
--  NPC: Zaoso
--  Type: Standard NPC and Quest NPC
--  Involved with Quest: 'A Certain Substitute Patrolman'
--  @zone 256
-- @pos -94 3 -11
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
        if ((ACSP == QUEST_ACCEPTED) and (player:getVar("ACSP_NPCs_Visited") == 1)) then
            -- Progresses Quest: 'A Certain Substitute Patrolman'
            player:startEvent(0x09F9);
        else
            -- Standard dialogue
            player:startEvent(0x023E);
        end
    else
        -- Dialogue prior to joining colonization effort
        player:startEvent(0x01FA);
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
    if (csid == 0x09F9) then
        -- Progresses Quest: 'A Certain Substitute Patrolman'
        player:setVar("ACSP_NPCs_Visited", 2);
    end
end;
