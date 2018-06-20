-----------------------------------
-- Area: Gustav tunnel (212)
--  NPC: qm1 (???)
-- Quests: Cloak and Dagger (Evisceration WSNM "Baronial Bat")
-- !pos 52.8, -1, 19.9 212
-----------------------------------
package.loaded["scripts/zones/Gustav_Tunnel/TextIDs"] = nil
-----------------------------------
require("scripts/globals/wsquest")
require("scripts/zones/Gustav_Tunnel/TextIDs")
require("scripts/zones/Gustav_Tunnel/MobIDs")

function onTrigger(player,npc)
    dsp.wsquest.handleQmTrigger(dsp.wsquest.evisceration,player,BARONIAL_BAT)
end
