-----------------------------------
-- Area: Western Adoulin
-- NPC: Virsaint
-- Type: Standard NPC and Quest NPC
-- !pos 32 0 -5 256
-----------------------------------
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
        -- Standard dialogue
        player:startEvent(540)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    quests.onEventFinish(player, csid, option)
end
