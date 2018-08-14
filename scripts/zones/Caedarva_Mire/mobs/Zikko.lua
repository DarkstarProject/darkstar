-----------------------------------
-- Area: Caedarva Mire
--   NM: Zikko
-- !pos -608.5 11.3 -186.5 79
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

function onCriticalHit(mob)
    if math.random(100) <= 20 and mob:AnimationSub() == 0 then  -- 20% change to break that horn on crit
        mob:AnimationSub(1)
    end
end

function onMobDeath(mob, player, isKiller)
end