-----------------------------------
--  Area: Western Adoulin
--  NPC: Kongramm
--  Type: Standard NPC, Mission NPC, and Quest NPC
--  Involved with Mission: 'A Curse From The Past'
--  Involved with Quests: 'A Certain Substitute Patrolman' and 'Transporting'
--  @zone 256
-- @pos 61 32 138
-----------------------------------
require("scripts/globals/missions");
require("scripts/globals/quests");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local SOA_Mission = player:getCurrentMission(SOA);
    local ACSP = player:getQuestStatus(ADOULIN, A_CERTAIN_SUBSTITUTE_PATROLMAN);
    local Transporting = player:getQuestStatus(ADOULIN, TRANSPORTING);

    if ((SOA_Mission == A_CURSE_FROM_THE_PAST) and (not player:hasKeyItem(PIECE_OF_A_STONE_WALL))) then
        if (player:getVar("SOA_ACFTP_Kongramm") < 1) then
            -- Gives hint for SOA Mission: 'A Curse From the Past'
            player:startEvent(0x0094);
        else
            -- Reminds player of hint for SOA Mission: 'A Curse From the Past'
            player:startEvent(0x0095);
        end
    elseif ((Transporting == QUEST_ACCEPTED) and (player:getVar("Transporting_Status") < 1)) then
        -- Progresses Quest: 'Transporting'
        player:startEvent(0x0A20);
    elseif ((ACSP == QUEST_ACCEPTED) and (player:getVar("ACSP_NPCs_Visited") == 3)) then
        -- Progresses Quest: 'A Certain Substitute Patrolman'
        player:startEvent(0x09FB);
    else
        -- Standard dialogue
        player:startEvent(0x022E);
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
    if (csid == 0x0094) then
        -- Gave hint for SOA Mission: 'A Curse From the Past'
        player:setVar("SOA_ACFTP_Kongramm", 1);
    elseif (csid == 0x0A20) then
        -- Progresses Quest: 'Transporting'
        player:setVar("Transporting_Status", 1);
    elseif (csid == 0x09FB) then
        -- Progresses Quest: 'A Certain Substitute Patrolman'
        player:setVar("ACSP_NPCs_Visited", 4);
    end
end;
