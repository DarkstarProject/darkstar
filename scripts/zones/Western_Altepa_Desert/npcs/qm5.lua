-----------------------------------
-- Area: Western Altepa Desert
--  NPC: ??? (Beastmen Treasure qm5/chest2)
--   ID: 17289774
-- !pos 3.302 -0.302 -250.435 125
-----------------------------------
local ID = require("scripts/zones/Western_Altepa_Desert/IDs")

function onTrigger(player,npc)
    dsp.bmt.handleQmOnTrigger(player, npc, ID.text.SOMETHING_IS_BURIED_HERE, ID.text.NOTHING_OUT_OF_ORDINARY)
end

function onTrade(player,npc,trade)
    dsp.bmt.handleQmOnTrade(player,npc,trade)
end

function onEventFinish(player,csid)
    dsp.bmt.handleQmOnEventFinish(player,csid)
end
