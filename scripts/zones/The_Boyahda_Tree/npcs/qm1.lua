-----------------------------------
-- Area: The Boyahda Tree (153)
--  NPC: qm1 (???)
-- Quests: Shoot First, Ask Questions Later (Detonator WSNM "Beet Leafhopper")
-- !pos -11 -19 -177 153
-----------------------------------
package.loaded["scripts/zones/The_Boyahda_Tree/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/wsquest")
require("scripts/zones/The_Boyahda_Tree/TextIDs")
require("scripts/zones/The_Boyahda_Tree/MobIDs")

function onTrigger(player,npc)
    dsp.wsquest.handleQmTrigger(dsp.wsquest.detonator,player,BEET_LEAFHOPPER)
end