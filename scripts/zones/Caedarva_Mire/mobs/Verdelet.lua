-----------------------------------
-- Area: Caedarva Mire (79)
--   NM: Verdelet (Tier II ZNM)
-- !pos 417 -19.3 -70 79
-----------------------------------

function onCriticalHit(mob)
    if math.random(100) <= 20 and mob:AnimationSub() == 0 then  -- 20% change to break that horn on crit
        mob:AnimationSub(1)
    end
end

function onMobDeath(mob, player, isKiller)
end