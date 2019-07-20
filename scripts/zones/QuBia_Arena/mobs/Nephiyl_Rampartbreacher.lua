-----------------------------------
-- Area: Qu'Bia Arena
--  Mob: Nephiyl Rampartbreacher
-- BCNM: Demolition Squad
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(dsp.mobMod.SUPERLINK, mob:getShortID())
end

function onMobDeath(mob, player, isKiller)
end
