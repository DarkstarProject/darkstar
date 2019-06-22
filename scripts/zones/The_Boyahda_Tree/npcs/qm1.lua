-----------------------------------
-- Area: The Boyahda Tree (153)
--  NPC: qm1 (???)
-- Quests: Shoot First, Ask Questions Later (Detonator WSNM "Beet Leafhopper")
-- !pos -11 -19 -177 153
-----------------------------------
local ID = require("scripts/zones/The_Boyahda_Tree/IDs")
require("scripts/globals/wsquest")
-----------------------------------

function onTrigger(player, npc)
    dsp.wsquest.handleQmTrigger(dsp.wsquest.detonator, player, ID.mob.BEET_LEAFHOPPER)
end