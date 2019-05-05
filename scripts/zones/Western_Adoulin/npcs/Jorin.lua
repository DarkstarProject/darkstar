-----------------------------------
-- Area: Western Adoulin
-- NPC: Jorin
-- Type: Standard NPC and Quest Giver
-- !pos 92 32 152 256
-----------------------------------
require("scripts/globals/quests")

local quests = dsp.quest.involvedQuests({
    require("scripts/quests/adoulin/the_old_man_and_the_harpoon")
})
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    if not quests.onTrigger(player, npc) then
        player:startEvent(560) -- Standard dialogue
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    quests.onEventFinish(player, csid, option)
end
