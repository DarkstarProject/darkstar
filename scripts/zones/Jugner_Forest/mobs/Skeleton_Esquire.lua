----------------------------------
-- Area: Jugner_Forest
--   NM: Skeleton Esquire
-- Involved in Quest: A Timely Visit
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onMobInitialize(mob)

    mob:setMobMod(dsp.mobMod.IDLE_DESPAWN, 300) -- 5 minutes
    
end

function onMobSpawn(mob)

    DespawnMob(mob:getID(), 300)
    
end

function onAdditionalEffect(mob, target, damage)
end

function onMobFight(mob, target)

    -- Did not use Blood Weapon in the following video, but wiki seems to indicate Blood Weapon use.
    -- https://www.youtube.com/watch?v=GzUV6QGXGKY&feature=youtu.be
    --if mob:getHPP() <= 50 and mob:getLocalVar("bloodWeapon") == 0 then
    --    mob:useMobAbility(695)
    --    mob:setLocalVar("bloodWeapon", 1)
    --end

end

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
end
