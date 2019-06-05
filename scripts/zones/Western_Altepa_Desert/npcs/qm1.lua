-----------------------------------
-- Area: Western Altepa Desert (125)
--  NPC: qm1 (???)
-- Quests: Inheritance (Ground Strike WSNM "Maharaja")
-- !pos -660 0 -338 125
-----------------------------------
local ID = require("scripts/zones/Western_Altepa_Desert/IDs")
require("scripts/globals/wsquest")
-----------------------------------

function onTrigger(player,npc)
    dsp.wsquest.handleQmTrigger(dsp.wsquest.ground_strike, player, ID.mob.MAHARAJA)
end
