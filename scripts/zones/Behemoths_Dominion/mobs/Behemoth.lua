-----------------------------------
-- Area: Behemoth's Dominion
--  HNM: Behemoth
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/status");
-----------------------------------

function onMobInitialize(mob)
end;

function onMobSpawn(mob)
    if (LandKingSystem_NQ > 0 or LandKingSystem_HQ > 0) then
        GetNPCByID(17297459):setStatus(STATUS_DISAPPEAR);
    end
end;

function onMobDeath(mob, player, isKiller)
    player:addTitle(BEHEMOTHS_BANE);
end;

function onMobDespawn(mob)
    local Behemoth = mob:getID();
    local King_Behemoth = mob:getID()+1;
    local ToD = GetServerVariable("[POP]King_Behemoth");
    local kills = GetServerVariable("[PH]King_Behemoth");
    local popNow = (math.random(1,5) == 3 or kills > 6);

    if (LandKingSystem_HQ ~= 1 and ToD <= os.time() and popNow == true) then
        -- 0 = timed spawn, 1 = force pop only, 2 = BOTH
        if (LandKingSystem_NQ == 0) then
            DisallowRespawn(Behemoth, true);
        end

        DisallowRespawn(King_Behemoth, false);
        UpdateNMSpawnPoint(King_Behemoth);
        GetMobByID(King_Behemoth):setRespawnTime(math.random(75600,86400));
    else
        if (LandKingSystem_NQ ~= 1) then
            UpdateNMSpawnPoint(Behemoth);
            mob:setRespawnTime(math.random(75600,86400));
            SetServerVariable("[PH]King_Behemoth", kills + 1);
        end
    end

    if (LandKingSystem_NQ > 0 or LandKingSystem_HQ > 0) then
        GetNPCByID(17297459):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
    end
end;
