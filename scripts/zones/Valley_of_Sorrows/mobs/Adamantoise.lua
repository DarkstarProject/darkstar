-----------------------------------
-- Area: Valley of Sorrows
--  HNM: Adamantoise
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/status");

-----------------------------------
-- onMobInitialize
-----------------------------------

function onMobInitialize(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
    killer:addTitle(TORTOISE_TORTURER);
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
    local Adamantoise  = mob:getID();
    local Aspidochelone = 17301538;
    local ToD     = GetServerVariable("[POP]Aspidochelone");
    local kills   = GetServerVariable("[PH]Aspidochelone");
    if (LandKingSystem_HQ == 0 or LandKingSystem_HQ == 2) then
        if (ToD <= os.time(t) and GetMobAction(Aspidochelone) == 0) then
            if (math.random((1),(5)) == 3 or kills > 6) then
                DeterMob(Adamantoise, true);
                DeterMob(Aspidochelone, false);
                UpdateNMSpawnPoint(Aspidochelone);
                GetMobByID(Aspidochelone):setRespawnTime(math.random((75600),(86400)));
            elseif (LandKingSystem_NQ == 0 or LandKingSystem_NQ == 2) then
                UpdateNMSpawnPoint(Adamantoise);
                mob:setRespawnTime(math.random((75600),(86400)));
                SetServerVariable("[PH]Aspidochelone", kills + 1);
            end
        end
    elseif (LandKingSystem_NQ == 0 or LandKingSystem_NQ == 2) then
        UpdateNMSpawnPoint(Adamantoise);
        mob:setRespawnTime(math.random((75600),(86400)));
        SetServerVariable("[PH]Aspidochelone", kills + 1);
    end
end;