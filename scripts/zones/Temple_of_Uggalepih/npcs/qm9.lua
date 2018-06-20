-----------------------------------
-- Area: Temple of Uggalepih (159)
--  NPC: qm9 (???)
-- Quests: Axe the Competition (Decimation WSNM "Yallery Brown")
-- !pos 218 -8 206 159
-----------------------------------
package.loaded["scripts/zones/Temple_of_Uggalepih/TextIDs"] = nil
-----------------------------------
require("scripts/globals/wsquest")
require("scripts/zones/Temple_of_Uggalepih/TextIDs")
require("scripts/zones/Temple_of_Uggalepih/MobIDs")

function onTrigger(player,npc)
    dsp.wsquest.handleQmTrigger(dsp.wsquest.decimation,player,YALLERY_BROWN)
end