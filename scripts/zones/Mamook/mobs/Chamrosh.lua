-----------------------------------
-- Area: Mamook
--   NM: Chamrosh (Tier-1 ZNM)
-----------------------------------
mixins = {require("scripts/mixins/families/colibri_mimic")}
-----------------------------------

function onMobSpawn(mob)
    mob:setLocalVar("[colibri]reflect_blue_magic", 1)
end

function onMobDeath(mob, player, isKiller)
end