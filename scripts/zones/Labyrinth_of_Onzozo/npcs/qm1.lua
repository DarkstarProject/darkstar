-----------------------------------
-- Area: Labyrinth of Onzozo
--  NPC: qm1 (???)
-- Quests: Bugi Soden (Blade: Ku WSNM "Megapod Megalops")
-- !pos 110 15 162 213
-----------------------------------
package.loaded["scripts/zones/Labyrinth_of_Onzozo/TextIDs"] = nil
-----------------------------------
require("scripts/globals/wsquest")
require("scripts/zones/Labyrinth_of_Onzozo/TextIDs")
require("scripts/zones/Labyrinth_of_Onzozo/MobIDS")

function onTrigger(player,npc)
    dsp.wsquest.handleQmTrigger(dsp.wsquest.blade_ku,player,MEGAPOD_MEGALOPS)
end