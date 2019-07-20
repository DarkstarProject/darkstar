-----------------------------------
-- Area: Waughroon Shrine
--  Mob: Bi'Fho Jestergrin
-- BCNM: Grimshell Shocktroopers
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(dsp.mobMod.SUPERLINK, GetMobByID(mob:getID() - 3):getShortID())
end

function onMobDeath(mob, player, isKiller)
end
