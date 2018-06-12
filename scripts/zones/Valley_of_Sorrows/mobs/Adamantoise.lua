-----------------------------------
-- Area: Valley of Sorrows
--  HNM: Adamantoise
-----------------------------------
require("scripts/zones/Valley_of_Sorrows/MobIDs")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/titles")
-----------------------------------

function onMobInitialize(mob)
end

function onMobSpawn(mob)
    if LandKingSystem_NQ > 0 or LandKingSystem_HQ > 0 then
        GetNPCByID(ADAMANTOISE_QM):setStatus(dsp.status.DISAPPEAR)
    end
    if LandKingSystem_HQ == 0 then
        SetDropRate(24,3344,0) -- do not drop clump_of_red_pondweed
    end
end

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.title.TORTOISE_TORTURER)
end

function onMobDespawn(mob)
    local ToD = GetServerVariable("[POP]Aspidochelone")
    local kills = GetServerVariable("[PH]Aspidochelone")
    local popNow = (math.random(1,5) == 3 or kills > 6)

    if LandKingSystem_HQ ~= 1 and ToD <= os.time() and popNow then
        -- 0 = timed spawn, 1 = force pop only, 2 = BOTH
        if LandKingSystem_NQ == 0 then
            DisallowRespawn(ADAMANTOISE, true)
        end

        DisallowRespawn(ASPIDOCHELONE, false)
        UpdateNMSpawnPoint(ASPIDOCHELONE)
        GetMobByID(ASPIDOCHELONE):setRespawnTime(math.random(75600,86400))
    else
        if LandKingSystem_NQ ~= 1 then
            UpdateNMSpawnPoint(ADAMANTOISE)
            mob:setRespawnTime(math.random(75600,86400))
            SetServerVariable("[PH]Aspidochelone", kills + 1)
        end
    end

    if LandKingSystem_NQ > 0 or LandKingSystem_HQ > 0 then
        GetNPCByID(ADAMANTOISE_QM):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME)
    end
end
