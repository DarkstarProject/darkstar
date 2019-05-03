-----------------------------------
-- Area: Western Adoulin
-- NPC: Zaoso
-- Type: Standard NPC and Quest NPC
-- !pos -94 3 -11 256
-----------------------------------
require("scripts/globals/missions")
require("scripts/globals/quests")

local quests =
{
    require("scripts/quests/adoulin/a_certain_substitute_patrolman")
}
quests = dsp.quest.involvedQuests(quests)
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    if not quests.onTrigger(player, npc) then
        if player:getCurrentMission(SOA) >= LIFE_ON_THE_FRONTIER then
            -- Standard dialogue
            player:startEvent(574)
        else
            -- Dialogue prior to joining colonization effort
            player:startEvent(506)
        end
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    quests.onEventFinish(player, csid, option)
end
