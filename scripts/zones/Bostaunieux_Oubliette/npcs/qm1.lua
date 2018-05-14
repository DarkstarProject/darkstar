-----------------------------------
-- Area: Bostaunieux Oubliette (167)
-- NPC: qm1 (???)
-- Quests: The Walls of Your Mind (Asuran Fists WSNM "Bodach")
-- !zone 236
-- !pos 20 17 -140
-----------------------------------
package.loaded["scripts/zones/Bostaunieux_Oubliette/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/wsquest");
require("scripts/zones/Bostaunieux_Oubliette/TextIDs");

function onTrigger(player,npc)
    handleQmTrigger(dsp.wsquest.theWallsOfYourMind, player);
end;