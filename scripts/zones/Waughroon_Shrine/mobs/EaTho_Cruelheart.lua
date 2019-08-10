-----------------------------------
-- Area: Waughroon Shrine
--  Mob: Ea'Tho Cruelheart
-- BCNM: Grimshell Shocktroopers
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(dsp.mobMod.SUPERLINK, GetMobByID(mob:getID() - 5):getShortID())
end

function onMobDeath(mob, player, isKiller)
end
