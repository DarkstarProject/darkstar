----------------------------------
-- Area: Gustav Tunnel
--  NM:  Wyvernpoacher Drachlox
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    -- Set Wyvernpoacher Drachlox's Window Open Time
    local wait = math.random(720,28800);  -- 2-8 hours
    SetServerVariable("[POP]Wyvernpoacher_Drachlox", os.time(t) + wait);
    DeterMob(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Wyvernpoacher_Drachlox");
    SetServerVariable("[PH]Wyvernpoacher_Drachlox", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;