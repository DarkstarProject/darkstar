-----------------------------------
-- Area: Dragons Aery
--  HNM: Nidhogg
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
end

function onMobFight(mob, target)
    local battletime = mob:getBattleTime()
    local twohourTime = mob:getLocalVar("twohourTime")

    if twohourTime == 0 then
        mob:setLocalVar("twohourTime",math.random(30,90))
    end

    if battletime >= twohourTime then
        mob:useMobAbility(956)
        -- technically aerial hurricane wing, but I'm using 700 for his two hour
        --(since I have no inclination to spend millions on a PI to cap one name you never see)
        mob:setLocalVar("twohourTime",battletime + math.random(60,120))
    end
end

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.title.NIDHOGG_SLAYER)
end

function onMobDespawn(mob)
    -- Set Nidhogg's Window Open Time
    if LandKingSystem_HQ ~= 1 then
        local wait = 72 * 3600
        SetServerVariable("[POP]Nidhogg", os.time() + wait) -- 3 days
        if LandKingSystem_HQ == 0 then -- Is time spawn only
            DisallowRespawn(mob:getID(), true)
        end
    end

    -- Set Fafnir's spawnpoint and respawn time (21-24 hours)
    if LandKingSystem_NQ ~= 1 then
        SetServerVariable("[PH]Nidhogg", 0)
        DisallowRespawn(FAFNIR, false)
        UpdateNMSpawnPoint(FAFNIR)
        GetMobByID(FAFNIR):setRespawnTime(math.random(75600,86400))
    end

    if LandKingSystem_NQ > 0 or LandKingSystem_HQ > 0 then
        GetNPCByID(FAFNIR_QM):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME)
    end
end
