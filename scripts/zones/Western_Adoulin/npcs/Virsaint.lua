-----------------------------------
--  Area: Western Adoulin
--  NPC: Virsaint
--  Type: Standard NPC and Quest NPC
--  Involved with Quests: 'A Certain Substitute Patrolman'
--  @zone 256
-- @pos 32 0 -5
-----------------------------------
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
    if ((ACSP == QUEST_ACCEPTED) and (player:getVar("ACSP_NPCs_Visited") == 4)) then
        -- Progresses Quest: 'A Certain Substitute Patrolman'
        player:startEvent(0x09FC);
    else
        -- Standard dialogue
        player:startEvent(0x021C);
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
    if (csid == 0x09FC) then
        -- Progresses Quest: 'A Certain Substitute Patrolman'
        player:setVar("ACSP_NPCs_Visited", 5);
    end
end;
