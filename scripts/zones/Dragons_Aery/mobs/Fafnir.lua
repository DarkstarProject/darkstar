-----------------------------------
-- Area: Dragons Aery
--  HNM: Fafnir
-----------------------------------
require("scripts/zones/Dragons_Aery/MobIDs")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/titles")
-----------------------------------

function onMobInitialize(mob)
end

function onMobSpawn(mob)
    if LandKingSystem_NQ > 0 or LandKingSystem_HQ > 0 then
        GetNPCByID(FAFNIR_QM):setStatus(dsp.status.DISAPPEAR)
    end
    if LandKingSystem_HQ == 0 then
        SetDropRate(918,3340,0) -- do not drop cup_of_sweet_tea
    end
end

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.title.FAFNIR_SLAYER)
end

function onMobDespawn(mob)
    local ToD = GetServerVariable("[POP]Nidhogg")
    local kills = GetServerVariable("[PH]Nidhogg")
    local popNow = (math.random(1,5) == 3 or kills > 6)

    if LandKingSystem_HQ ~= 1 and ToD <= os.time() and popNow then
        -- 0 = timed spawn, 1 = force pop only, 2 = BOTH
        if LandKingSystem_NQ == 0 then
            DisallowRespawn(FAFNIR, true)
        end

        DisallowRespawn(NIDHOGG, false)
        UpdateNMSpawnPoint(NIDHOGG)
        GetMobByID(NIDHOGG):setRespawnTime(math.random(75600,86400))
    else
        if LandKingSystem_NQ ~= 1 then
            UpdateNMSpawnPoint(FAFNIR)
            mob:setRespawnTime(math.random(75600,86400))
            SetServerVariable("[PH]Nidhogg", kills + 1)
        end
    end
end
