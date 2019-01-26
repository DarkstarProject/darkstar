-----------------------------------
-- Area: La Vaule [S]
--   NM: Hawkeyed Dnatbat
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

function onMobSpawn(mob)
    mob:setLocalVar("mainSpec", dsp.jsa.EES_ORC)
end

function onMobDeath(mob, player, isKiller)
end
