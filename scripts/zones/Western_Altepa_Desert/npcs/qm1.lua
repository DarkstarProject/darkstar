-----------------------------------
-- Area: Western Altepa Desert (125)
--  NPC: qm1 (???)
-- Quests: Inheritance (Ground Strike WSNM "Maharaja")
-- !pos -660 0 -338 125
-----------------------------------
package.loaded["scripts/zones/Western_Altepa_Desert/TextIDs"] = nil
-----------------------------------
require("scripts/globals/wsquest")
require("scripts/zones/Western_Altepa_Desert/TextIDs")
require("scripts/zones/Western_Altepa_Desert/MobIDs")

function onTrigger(player,npc)
    dsp.wsquest.handleQmTrigger(dsp.wsquest.ground_strike,player,MAHARAJA)
end