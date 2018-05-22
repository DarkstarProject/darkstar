-----------------------------------
-- Area: Ro'Maeve (122)
-- NPC: qm1 (???)
-- Quests: Orastery Woes (Black Halo WSNM "Eldhrimnir")
-- !pos 197 -8 -27.5 122
-----------------------------------
package.loaded["scripts/zones/RoMaeve/TextIDs"] = nil
-----------------------------------
require("scripts/globals/wsquest")
require("scripts/zones/RoMaeve/TextIDs")
require("scripts/zones/RoMaeve/MobIDs")

function onTrigger(player,npc)
    dsp.wsquest.handleQmTrigger(dsp.wsquest.black_halo,player,ELDHRIMNIR)
end