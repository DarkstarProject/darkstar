-----------------------------------
-- Area: Western Altepa Desert
--  NPC: ??? (Beastmen Treasure qm7/chest4)
-- !pos -454.701 -3.465 -286.864 125
-----------------------------------
local ID = require("scripts/zones/Western_Altepa_Desert/IDs")
require("scripts/globals/beastmentreasure")
-----------------------------------

function onTrigger(player,npc)
    tpz.bmt.handleQmOnTrigger(player,npc,ID.text.SOMETHING_IS_BURIED_HERE,ID.text.NOTHING_OUT_OF_ORDINARY,ID.npc.BEASTMEN_TREASURE)
end

function onTrade(player,npc,trade)
    tpz.bmt.handleQmOnTrade(player,npc,trade,ID.npc.BEASTMEN_TREASURE)
end

function onEventFinish(player,csid)
    tpz.bmt.handleQmOnEventFinish(player,csid)
end
