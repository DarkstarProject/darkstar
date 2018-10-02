-----------------------------------
-- Area: Temple of Uggalepih (159)
--  NPC: qm9 (???)
-- Quests: Axe the Competition (Decimation WSNM "Yallery Brown")
-- !pos 218 -8 206 159
-----------------------------------
require("scripts/globals/wsquest")
local ID = require("scripts/zones/Temple_of_Uggalepih/IDs")

function onTrigger(player,npc)
    dsp.wsquest.handleQmTrigger(dsp.wsquest.decimation,player,ID.mob.YALLERY_BROWN)
end