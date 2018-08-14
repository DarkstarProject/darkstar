-----------------------------------
-- Area: Behemoth's Dominion
--  HNM: Behemoth
-----------------------------------
require("scripts/zones/Behemoths_Dominion/MobIDs")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/titles")
-----------------------------------

function onMobInitialize(mob)
end

function onMobSpawn(mob)
    if LandKingSystem_NQ > 0 or LandKingSystem_HQ > 0 then
        GetNPCByID(BEHEMOTH_QM):setStatus(dsp.status.DISAPPEAR)
    end
    if LandKingSystem_HQ == 0 then
        SetDropRate(270,3342,0) -- do not drop savory_shank
    end
end

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.title.BEHEMOTHS_BANE)
end

function onMobDespawn(mob)
    local ToD = GetServerVariable("[POP]King_Behemoth")
    local kills = GetServerVariable("[PH]King_Behemoth")
    local popNow = (math.random(1,5) == 3 or kills > 6)

    if LandKingSystem_HQ ~= 1 and ToD <= os.time() and popNow then
        -- 0 = timed spawn, 1 = force pop only, 2 = BOTH
        if LandKingSystem_NQ == 0 then
            DisallowRespawn(BEHEMOTH, true)
        end

        DisallowRespawn(KING_BEHEMOTH, false)
        UpdateNMSpawnPoint(KING_BEHEMOTH)
        GetMobByID(KING_BEHEMOTH):setRespawnTime(math.random(75600,86400))
    else
        if LandKingSystem_NQ ~= 1 then
            UpdateNMSpawnPoint(BEHEMOTH)
            mob:setRespawnTime(math.random(75600,86400))
            SetServerVariable("[PH]King_Behemoth", kills + 1)
        end
    end
end
