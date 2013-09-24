-----------------------------------
-- Area: Valley of Sorrows
-- NPC:  Aspidochelone
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

    killer:addTitle(ASPIDOCHELONE_SINKER);

    -- Set Aspidochelone's Window Open Time
    wait = 72 * 3600
    SetServerVariable("[POP]Aspidochelone", os.time(t) + wait); -- 3 days
    DeterMob(mob:getID(), true);

    -- Set Adamantoise's spawnpoint and respawn time (21-24 hours)
    Adamantoise = 17301537;
    SetServerVariable("[PH]Aspidochelone", 0);
    DeterMob(Adamantoise, false);
    UpdateNMSpawnPoint(Adamantoise);
    GetMobByID(Adamantoise):setRespawnTime(math.random((75600),(86400)));
    
end;