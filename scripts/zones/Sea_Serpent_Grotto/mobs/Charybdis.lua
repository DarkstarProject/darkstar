----------------------------------
-- Area: Valkurm Dunes
--   NM: Charybdis
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    -- Set Charybdis Window Open Time
    local wait = math.random(28800,43200) -- 8-12 hours
    SetServerVariable("[POP]Charybdis", os.time(t) + wait );
    DeterMob(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Charybdis");
    SetServerVariable("[PH]Charybdis", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;