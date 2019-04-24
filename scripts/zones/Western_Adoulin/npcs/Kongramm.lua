-----------------------------------
-- Area: Western Adoulin
-- NPC: Kongramm
-- Type: Standard NPC, Mission NPC, and Quest NPC
-- Involved with Mission: 'A Curse From The Past'
-- Involved with Quests: 'Transporting'
-- !pos 61 32 138 256
-----------------------------------
require("scripts/globals/missions")
require("scripts/globals/quests")

local quests =
{
    {dsp.quest.log_id.ADOULIN, dsp.quest.id.adoulin.A_CERTAIN_SUBSTITUTE_PATROLMAN}
}
quests = dsp.quest.involvedQuests(quests)
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    local SOA_Mission = player:getCurrentMission(SOA)
    local Transporting = player:getQuestStatus(ADOULIN, dsp.quest.id.adoulin.TRANSPORTING)

    if ((SOA_Mission == A_CURSE_FROM_THE_PAST) and (not player:hasKeyItem(dsp.ki.PIECE_OF_A_STONE_WALL))) then
        if (player:getVar("SOA_ACFTP_Kongramm") < 1) then
            -- Gives hint for SOA Mission: 'A Curse From the Past'
            player:startEvent(148)
        else
            -- Reminds player of hint for SOA Mission: 'A Curse From the Past'
            player:startEvent(149)
        end
    else
        if not quests.onTrigger(player, npc) then
            if ((Transporting == QUEST_ACCEPTED) and (player:getVar("Transporting_Status") < 1)) then
                -- Progresses Quest: 'Transporting'
                player:startEvent(2592)
            else
                -- Standard dialogue
                player:startEvent(558)
            end
        end
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    if not quests.onEventFinish(player, csid, option) then
        if (csid == 148) then
            -- Gave hint for SOA Mission: 'A Curse From the Past'
            player:setVar("SOA_ACFTP_Kongramm", 1)
        elseif (csid == 2592) then
            -- Progresses Quest: 'Transporting'
            player:setVar("Transporting_Status", 1)
        end
    end
end
