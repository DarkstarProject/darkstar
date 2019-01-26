-----------------------------------
-- Area: Labyrinth of Onzozo
--  NPC: qm1 (???)
-- Quests: Bugi Soden (Blade: Ku WSNM "Megapod Megalops")
-- !pos 110 15 162 213
-----------------------------------
require("scripts/globals/wsquest")
local ID = require("scripts/zones/Labyrinth_of_Onzozo/IDs")

function onTrigger(player,npc)
    dsp.wsquest.handleQmTrigger(dsp.wsquest.blade_ku,player,ID.mob.MEGAPOD_MEGALOPS)
end