-----------------------------------
-- Area: Yhoator Jungle
--  NPC: ??? (Beastmen Treasure qm4/chest0)
-- !pos -149.929 -1.148 56.761 124
-----------------------------------
local ID = require("scripts/zones/Yhoator_Jungle/IDs")
require("scripts/globals/beastmentreasure")
-----------------------------------

function onTrigger(player,npc)
    dsp.bmt.handleQmOnTrigger(player,npc,ID.text.SOMETHING_IS_BURIED_HERE,ID.text.NOTHING_OUT_OF_ORDINARY,ID.npc.BEASTMEN_TREASURE)
end

function onTrade(player,npc,trade)
    dsp.bmt.handleQmOnTrade(player,npc,trade,ID.npc.BEASTMEN_TREASURE)
end

function onEventFinish(player,csid)
    dsp.bmt.handleQmOnEventFinish(player,csid)
end
