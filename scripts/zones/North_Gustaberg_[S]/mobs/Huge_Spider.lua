-----------------------------------
-- Area: North Gustaberg [S]
--  MOB: Huge Spider
-- Note: Place holder for Ankabut
-----------------------------------
require("scripts/zones/North_Gustaberg_[S]/MobIDs")
require("scripts/globals/mobs")

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    phOnDespawn(mob,ANKABUT_PH,10,3600) -- 1 hour
end
