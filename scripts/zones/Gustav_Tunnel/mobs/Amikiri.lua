----------------------------------
-- Area: Gustav Tunnel
--   NM: Amikiri
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    -- Set Amikiri's Window Open Time
    local wait = math.random(7,9) * 3600;
    SetServerVariable("[POP]Amikiri", os.time(t) + wait); -- 7-9 hours
    DeterMob(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Amikiri");
    SetServerVariable("[PH]Amikiri", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;