-----------------------------------
-- Area: Quicksand Caves
--  NPC: qm3 (???)
-- Quests: Old Wounds (Savage Blade WSNM "Girtablulu")
-- !pos -145 2 446 208
-----------------------------------
package.loaded["scripts/zones/Quicksand_Caves/TextIDs"] = nil
-----------------------------------
require("scripts/globals/wsquest")
require("scripts/zones/Quicksand_Caves/TextIDs")
require("scripts/zones/Quicksand_Caves/MobIDs")

function onTrigger(player,npc)
    dsp.wsquest.handleQmTrigger(dsp.wsquest.savage_blade,player,GIRTABLULU)
end