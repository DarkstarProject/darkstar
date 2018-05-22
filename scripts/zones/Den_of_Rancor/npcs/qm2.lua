-----------------------------------
-- Area: Den of Rancor
--  NPC: qm2 (???)
-- Quests: Souls in Shadow (Spiral Hell WSNM "Mokumokuren")
-- !pos 118 36 -281 160
-----------------------------------
package.loaded["scripts/zones/Den_of_Rancor/TextIDs"] = nil
-----------------------------------
require("scripts/globals/wsquest")
require("scripts/zones/Den_of_Rancor/TextIDs")
require("scripts/zones/Den_of_Rancor/MobIDs")

function onTrigger(player,npc)
    dsp.wsquest.handleQmTrigger(dsp.wsquest.spiral_hell,player,MOKUMOKUREN)
end