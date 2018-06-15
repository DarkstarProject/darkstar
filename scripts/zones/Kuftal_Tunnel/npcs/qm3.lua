-----------------------------------
-- Area: Kuftal Tunnel (174)
-- NPC: qm3 (???)
-- Quests: The Potential Within (Tachi: Kasha WSNM "Kettenkaefer")
-- !pos 200 11 99 174
-----------------------------------
package.loaded["scripts/zones/Kuftal_Tunnel/TextIDs"] = nil
-----------------------------------
require("scripts/globals/wsquest")
require("scripts/zones/Kuftal_Tunnel/TextIDs")
require("scripts/zones/Kuftal_Tunnel/MobIDs")

function onTrigger(player,npc)
    dsp.wsquest.handleQmTrigger(dsp.wsquest.tachi_kasha,player,KETTENKAEFER)
end