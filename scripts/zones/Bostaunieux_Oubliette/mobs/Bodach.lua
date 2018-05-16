----------------------------------
-- Area: Bostaunieux Oubliette (167)
--  MOB: Bodach
--   ID: 17461479
-- Note: Popped by qm1
-- Involved in Quest: The Walls of Your Mind
-- !pos -159 -7 5 167
-----------------------------------
require("scripts/globals/wsquest")

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.EXP_BONUS, -100)
end

function onMobDeath(mob, player, isKiller)
    handleWsnmDeath(dsp.wsquest.theWallsOfYourMind, player)
end