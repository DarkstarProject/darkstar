-----------------------------------
-- Area: Sea Serpent Grotto
--  NPC: qm1 (???)
-- Quests: Methods Create Madness (Impulse Drive WSNM "Water Leaper")
-- !pos 107 0.7 -125.25 176
-----------------------------------
package.loaded["scripts/zones/Sea_Serpent_Grotto/TextIDs"] = nil
-----------------------------------
require("scripts/globals/wsquest")
require("scripts/zones/Sea_Serpent_Grotto/TextIDs")
require("scripts/zones/Sea_Serpent_Grotto/MobIDs")

function onTrigger(player,npc)
    dsp.wsquest.handleQmTrigger(dsp.wsquest.impulse_drive,player,WATER_LEAPER)
end