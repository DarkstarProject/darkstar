-----------------------------------
-- Area: Kuftal Tunnel (174)
-- NPC: qm3 (???)
-- Quests: The Potential Within (Tachi: Kasha WSNM "Kettenkaefer")
-- !pos 200 11 99 174
-----------------------------------
require("scripts/globals/wsquest")
local ID = require("scripts/zones/Kuftal_Tunnel/IDs")

function onTrigger(player,npc)
    dsp.wsquest.handleQmTrigger(dsp.wsquest.tachi_kasha,player,ID.mob.KETTENKAEFER)
end