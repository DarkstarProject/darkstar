-----------------------------------
-- Area: Ifrit's Cauldron (205)
--  NPC: qm3 (???)
-- Quests: Blood and Glory (Retribution WSNM "Cailleach Bheur")
-- !pos 119 20 144 205
-----------------------------------
local ID = require("scripts/zones/Ifrits_Cauldron/IDs")
require("scripts/globals/wsquest")
-----------------------------------

function onTrigger(player, npc)
    dsp.wsquest.handleQmTrigger(dsp.wsquest.retribution, player, ID.mob.CAILLEACH_BHEUR)
end