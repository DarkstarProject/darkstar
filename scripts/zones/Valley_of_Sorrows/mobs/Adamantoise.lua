-----------------------------------
-- Area: Valley of Sorrows
-- NPC:  Adamantoise
-----------------------------------

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
    killer:addTitle(TORTOISE_TORTURER);

    local Adamantoise  = mob:getID();
    local Aspidochelone = 17301538; 
    local ToD     = GetServerVariable("[POP]Aspidochelone");
    local kills   = GetServerVariable("[PH]Aspidochelone");
    DeterMob(Adamantoise, true);
    if (ToD <= os.time(t) and GetMobAction(Aspidochelone) == 0) then
        if (math.random((1),(5)) == 3 or kills > 6) then
            UpdateNMSpawnPoint(Aspidochelone);
            GetMobByID(Aspidochelone):setRespawnTime(math.random((75600),(86400)));
        end
    else
        UpdateNMSpawnPoint(Adamantoise);
        mob:setRespawnTime(math.random((75600),(86400)));
        SetServerVariable("[PH]Aspidochelone", kills + 1);
    end
end;