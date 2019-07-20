-----------------------------------
-- Area: Waughroon Shrine
--  Mob: Ku'Tya Hotblood
-- BCNM: Grimshell Shocktroopers
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(dsp.mobMod.SUPERLINK, GetMobByID(mob:getID() - 4):getShortID())
end

function onMobDeath(mob, player, isKiller)
end
