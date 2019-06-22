-----------------------------------
-- Area: Oldton Movalpolos
--   NM: Goblin Wolfman
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.IDLE_DESPAWN, 180)
end

function onMobDeath(mob, player, isKiller)
end
