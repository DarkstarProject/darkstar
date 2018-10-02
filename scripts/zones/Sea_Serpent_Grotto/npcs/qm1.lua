-----------------------------------
-- Area: Sea Serpent Grotto
--  NPC: qm1 (???)
-- Quests: Methods Create Madness (Impulse Drive WSNM "Water Leaper")
-- !pos 107 0.7 -125.25 176
-----------------------------------
require("scripts/globals/wsquest")
local ID = require("scripts/zones/Sea_Serpent_Grotto/IDs")

function onTrigger(player,npc)
    dsp.wsquest.handleQmTrigger(dsp.wsquest.impulse_drive,player,ID.mob.WATER_LEAPER)
end