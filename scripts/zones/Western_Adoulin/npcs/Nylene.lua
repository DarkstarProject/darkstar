-----------------------------------
-- Area: Western Adoulin
-- NPC: Nylene
-- Type: Standard NPC and Quest NPC
-- !pos 12 0 -82 256
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
    if not quests.onTrigger(player, npc) then
        if player:getCurrentMission(SOA) >= LIFE_ON_THE_FRONTIER then
            -- Standard dialogue
            player:startEvent(562)
        else
            -- Dialogue prior to joining colonization effort
            player:startEvent(533)
        end
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    quests.onEventFinish(player, csid, option)
end