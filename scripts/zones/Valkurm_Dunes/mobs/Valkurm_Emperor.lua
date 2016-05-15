----------------------------------
-- Area: Valkurm Dunes
--  NM:  Valkurm Emperor
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    -- Set VE's Window Open Time
    SetServerVariable("[POP]Valkurm_Emperor", os.time(t) + 3600); -- 1 hour
    DeterMob(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Valkurm_Emperor");
    SetServerVariable("[PH]Valkurm_Emperor", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)

    SetServerVariable("[POP]Valkurm_Emperor", os.time(t) + 3600); -- 1 hour
    DeterMob(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Valkurm_Emperor");
    SetServerVariable("[PH]Valkurm_Emperor", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;
