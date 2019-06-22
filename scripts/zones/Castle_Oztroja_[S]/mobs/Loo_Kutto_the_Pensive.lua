-----------------------------------
-- Area: Castle Oztroja (S)
--   NM: Loo Kutto the Pensive
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

function onMobFight(mob, target)
    --[[
    "Possess high Regain and/or Store TP, which seems to increase further as its HP declines."

    Using formula below, mob will have:
    at 100% HP, 20 storeTP
        75% HP, 80 storeTP
        50% HP, 140 storeTP
        25% HP, 200 storeTP (caps here - this is about 50% TP per greatsword swing)
    --]]
    local power = 20 + math.floor(utils.clamp(100 - mob:getHPP(), 0, 75) * 2.4)
    mob:setMod(dsp.mod.STORETP, power)
end

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(math.random(7200, 14400)) -- 2 to 4 hours
end
