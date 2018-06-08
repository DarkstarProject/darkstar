-----------------------------------
-- Area: The Sanctuary of Zi'Tah (121)
--  NPC: qm1 (???)
-- Quests: The Weight of Your Limits (Steel Cyclone WSNM "Greenman")
-- !pos -324 1 474 121
-----------------------------------
package.loaded["scripts/zones/The_Sanctuary_of_ZiTah/TextIDs"] = nil
-----------------------------------
require("scripts/globals/wsquest")
require("scripts/zones/The_Sanctuary_of_ZiTah/TextIDs")
require("scripts/zones/The_Sanctuary_of_ZiTah/MobIDs")

function onTrigger(player,npc)
    dsp.wsquest.handleQmTrigger(dsp.wsquest.steel_cyclone,player,GREENMAN)
end