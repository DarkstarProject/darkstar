-----------------------------------
-- Area: Yhoator Jungle
--  NPC: ??? (Beastmen Treasure qm6/chest2)
--   ID: 17285689
-- !pos 198.65 -0.783 58.046 124
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
