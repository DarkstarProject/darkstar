----------------------------------
-- Area: Bostaunieux Oubliette (167)
--  MOB: Bodach
--   ID: 17461479
-- Note: Popped by qm1
-- Involved in Quest: The Walls of Your Mind
-- !zone 236
-- !pos -159 -7 5
-----------------------------------
require("scripts/globals/wsquest");

function onMobDeath(mob, player, isKiller)
    handleWsnmDeath(dsp.wsquest.theWallsOfYourMind, player);
end;