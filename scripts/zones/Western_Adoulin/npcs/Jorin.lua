-----------------------------------
-- Area: Western Adoulin
--  NPC: Jorin
-- Type: Standard NPC and Quest Giver
-- Starts, Involved with, and Finishes Quest: 'The Old Man and the Harpoon'
-- !pos 92 32 152 256
-----------------------------------
require("scripts/globals/quests")

local quest_table =
{
    require("scripts/quests/adoulin/the_old_man_and_the_harpoon"),
}
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if not dsp.quests.onTrigger(player, npc, quest_table) then
        player:startEvent(560) -- Standard dialogue
    end
end

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    dsp.quests.onEventFinish(player, csid, option, quest_table)
end
