-----------------------------------
-- Area: Yhoator Jungle
--  NPC: ??? (Beastmen Treasure qm9/chest5)
--   ID: 17285692
-- !pos 240.341 -0.826 -402.532 124
-----------------------------------
local ID = require("scripts/zones/Yhoator_Jungle/IDs")

function onTrigger(player,npc)
    dsp.bmt.handleQmOnTrigger(player, npc, ID.text.SOMETHING_IS_BURIED_HERE, ID.text.NOTHING_OUT_OF_ORDINARY)
end

function onTrade(player,npc,trade)
    dsp.bmt.handleQmOnTrade(player,npc,trade)
end

function onEventFinish(player,csid)
    dsp.bmt.handleQmOnEventFinish(player,csid)
end
