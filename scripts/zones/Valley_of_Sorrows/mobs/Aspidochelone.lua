-----------------------------------
-- Area: Valley of Sorrows
--  HNM: Aspidochelone
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/status");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)

    killer:addTitle(ASPIDOCHELONE_SINKER);

    -- Set Aspidochelone's Window Open Time
    if (LandKingSystem_HQ == 0 or LandKingSystem_HQ == 2) then
        local wait = 72 * 3600
        SetServerVariable("[POP]Aspidochelone", os.time(t) + wait); -- 3 days
        DeterMob(mob:getID(), true);
    end

    -- Set Adamantoise's spawnpoint and respawn time (21-24 hours)
    if (LandKingSystem_NQ == 0 or LandKingSystem_NQ == 2) then
        Adamantoise = 17301537;
        SetServerVariable("[PH]Aspidochelone", 0);
        DeterMob(Adamantoise, false);
        UpdateNMSpawnPoint(Adamantoise);
        GetMobByID(Adamantoise):setRespawnTime(math.random((75600),(86400)));
    end

end;