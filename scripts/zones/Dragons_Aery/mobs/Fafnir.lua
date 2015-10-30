-----------------------------------
-- Area: Dragons Aery
--  HNM: Fafnir
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
    killer:addTitle(FAFNIR_SLAYER);
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
    local Fafnir  = mob:getID();
    local Nidhogg = 17408019;
    local ToD     = GetServerVariable("[POP]Nidhogg");
    local kills   = GetServerVariable("[PH]Nidhogg");
    if (LandKingSystem_HQ == 0 or LandKingSystem_HQ == 2) then
        if (ToD <= os.time(t) and GetMobAction(Nidhogg) == 0) then
            if (math.random((1),(5)) == 3 or kills > 6) then
                DeterMob(Fafnir, true);
                DeterMob(Nidhogg, false);
                UpdateNMSpawnPoint(Nidhogg);
                GetMobByID(Nidhogg):setRespawnTime(math.random((75600),(86400)));
            elseif (LandKingSystem_NQ == 0 or LandKingSystem_NQ == 2) then
                UpdateNMSpawnPoint(Fafnir);
                mob:setRespawnTime(math.random((75600),(86400)));
                SetServerVariable("[PH]Nidhogg", kills + 1);
                GetMobByID(Nidhogg):setRespawnTime(math.random((75600),(86400)));
            end
        end
    elseif (LandKingSystem_NQ == 0 or LandKingSystem_NQ == 2) then
        UpdateNMSpawnPoint(Fafnir);
        mob:setRespawnTime(math.random((75600),(86400)));
        SetServerVariable("[PH]Nidhogg", kills + 1);
    end
end;