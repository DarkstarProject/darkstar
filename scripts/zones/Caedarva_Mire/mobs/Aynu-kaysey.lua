-----------------------------------
-- Area: Caedarva Mire
--   NM: Aynu-kasey
-----------------------------------
mixins = {require("scripts/mixins/families/qutrub")}
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    mob:setRespawnTime(math.random(7200, 14400)) -- 2 to 4 hours
end