-----------------------------------
-- Area: Yhoator Jungle
--  NPC: Peddlestox
-- !pos -499.914 1.470 -109.039 124
-- Active on LIGHTNINGDAY in this zone. To test on off-days, setStatus(dsp.status.NORMAL)
-----------------------------------
local ID = require("scripts/zones/Yhoator_Jungle/IDs")
require("scripts/globals/beastmentreasure")
-----------------------------------

function onTrigger(player)
    dsp.bmt.handleNpcOnTrigger(player,ID.npc.BEASTMEN_TREASURE)
end

function onTrade(player,npc,trade)
    dsp.bmt.handleNpcOnTrade(player,trade,ID.npc.BEASTMEN_TREASURE)
end

function onEventFinish(player,csid,option)
    dsp.bmt.handleNpcOnEventFinish(player,csid)
end
