-----------------------------------
-- Area: Boneyard_Gully
-- Name: Shikaree X
-----------------------------------

function onMobEngaged(mob,target)
    SpawnMob(mob:getID() + 2)
end

function onMobDeath(mob, player, isKiller)
end