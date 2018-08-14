-----------------------------------
-- Area: Valley of Sorrows
--  HNM: Aspidochelone
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
end

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.title.ASPIDOCHELONE_SINKER)
end

function onMobDespawn(mob)
    -- Set Aspidochelone's Window Open Time
    if LandKingSystem_HQ ~= 1 then
        local wait = 72 * 3600
        SetServerVariable("[POP]Aspidochelone", os.time() + wait) -- 3 days
        if LandKingSystem_HQ == 0 then -- Is time spawn only
            DisallowRespawn(mob:getID(), true)
        end
    end

    -- Set Adamantoise's spawnpoint and respawn time (21-24 hours)
    if LandKingSystem_NQ ~= 1 then
        SetServerVariable("[PH]Aspidochelone", 0)
        DisallowRespawn(ADAMANTOISE, false)
        UpdateNMSpawnPoint(ADAMANTOISE)
        GetMobByID(ADAMANTOISE):setRespawnTime(math.random(75600,86400))
    end
end
