-----------------------------------
-- Area: Kuftal Tunnel (174)
-- NPC: qm3 (???)
-- Quests: The Potential Within (Tachi: Kasha WSNM "Kettenkaefer")
-- !pos 200 11 99 174
-----------------------------------
local ID = require("scripts/zones/Kuftal_Tunnel/IDs")
require("scripts/globals/wsquest")
-----------------------------------

function onTrigger(player, npc)
    dsp.wsquest.handleQmTrigger(dsp.wsquest.tachi_kasha, player, ID.mob.KETTENKAEFER)
end