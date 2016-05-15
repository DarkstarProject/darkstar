----------------------------------
-- Area: Kuftal Tunnel
--   NM: Yowie
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    -- Set Yowie's Window Open Time
    local wait = math.random(7200,28800); -- 2-8 hours
    SetServerVariable("[POP]Yowie", os.time(t) + wait);
    DeterMob(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Yowie");
    SetServerVariable("[PH]Yowie", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;