-----------------------------------
-- Area: Bostaunieux Oubliette (167)
-- NPC: qm1 (???)
-- Quests: The Walls of Your Mind (Asuran Fists WSNM "Bodach")
-- !pos 20 17 -140 236
-----------------------------------
package.loaded["scripts/zones/Bostaunieux_Oubliette/TextIDs"] = nil
-----------------------------------
require("scripts/globals/wsquest")
require("scripts/zones/Bostaunieux_Oubliette/TextIDs")
require("scripts/zones/Bostaunieux_Oubliette/MobIDs")

function onTrigger(player,npc)
    dsp.wsquest.handleQmTrigger(dsp.wsquest.asuran_fists,player,BODACH)
end