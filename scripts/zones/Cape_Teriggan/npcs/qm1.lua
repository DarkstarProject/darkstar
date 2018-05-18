-----------------------------------
-- Area: Cape Teriggan
--  NPC: qm1 (???)
-- Quests: From Saplings Grow (Empyreal Arrow WSNM "Stolas")
-- !pos -157 -8 198.2 113
-----------------------------------
package.loaded["scripts/zones/Cape_Teriggan/TextIDs"] = nil
-----------------------------------
require("scripts/globals/wsquest")
require("scripts/zones/Cape_Teriggan/TextIDs")
require("scripts/zones/Cape_Teriggan/MobIDs")

function onTrigger(player,npc)
    dsp.wsquest.handleQmTrigger(dsp.wsquest.empyreal_arrow,player,STOLAS)
end