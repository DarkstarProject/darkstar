----------------------------------
-- Area: Kuftal Tunnel
--   NM: Amemet
-- ToDo: Amemet should walk in a big circle
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    -- Set Amemet's Window Open Time
    local wait = math.random(7200,43200); -- 2-12 hours
    SetServerVariable("[POP]Amemet", os.time(t) + wait);
    DeterMob(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Amemet");
    SetServerVariable("[PH]Amemet", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;