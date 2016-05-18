----------------------------------
-- Area: Kuftal Tunnel
--   NM: Pelican
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    -- Set Pelican's Window Open Time
    local wait = math.random(10800,43200); -- 4-12 hours
    SetServerVariable("[POP]Pelican", os.time(t) + wait); -- 4-12 hours
    DeterMob(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Pelican");
    SetServerVariable("[PH]Pelican", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;