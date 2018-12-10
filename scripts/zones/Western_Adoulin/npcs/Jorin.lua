-----------------------------------
-- Area: Western Adoulin
--  NPC: Jorin
-- Type: Standard NPC and Quest Giver
-- Starts, Involved with, and Finishes Quest: 'The Old Man and the Harpoon'
-- !pos 92 32 152 256
-----------------------------------
require("scripts/globals/quests")
local THE_OLD_MAN_AND_THE_HARPOON = require("scripts/quests/adoulin/the_old_man_and_the_harpoon")
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if not dsp.quests.onTrigger(player, npc, THE_OLD_MAN_AND_THE_HARPOON) then
        player:startEvent(560) -- Standard dialogue
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    dsp.quests.onEventFinish(player, csid, option, THE_OLD_MAN_AND_THE_HARPOON)
end;
