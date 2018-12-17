-----------------------------------
-- Area: Arrapago Remnants
--  MOB: Lamia Dancer
-----------------------------------
mixins = {require("scripts/mixins/families/lamie")}
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    local instance = mob:getInstance()
    instance:setProgress(instance:getProgress() + 1)
end;
