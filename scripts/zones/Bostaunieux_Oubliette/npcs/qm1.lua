-----------------------------------
-- Area: Bostaunieux Oubliette (167)
-- NPC: qm1 (???)
-- Quests: The Walls of Your Mind (Asuran Fists WSNM "Bodach")
-- !pos 20 17 -140 236
-----------------------------------
require("scripts/globals/wsquest")
local ID = require("scripts/zones/Bostaunieux_Oubliette/IDs")

function onTrigger(player,npc)
    dsp.wsquest.handleQmTrigger(dsp.wsquest.asuran_fists,player,ID.mob.BODACH)
end