-----------------------------------
-- Area: Konschtat Highlands
--   NM: Haty
-----------------------------------

function onMobRoam(mob)
    local hour = VanadielHour()
    if hour >= 5 and hour < 17 then
        DespawnMob(mob:getID())
    end
end

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setLocalVar("cooldown", os.time() + (144 * 13)) -- 13 vanadiel hours guarantees it will not spawn twice in the same night
end
