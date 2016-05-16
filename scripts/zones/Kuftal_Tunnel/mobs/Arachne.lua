----------------------------------
-- Area: Kuftal Tunnel
--   NM: Arachne
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    -- Set Arachne's Window Open Time
    local wait = math.random(7200,28800); -- 2-8 hours
    SetServerVariable("[POP]Arachne", os.time(t) + wait);
    DeterMob(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Arachne");
    SetServerVariable("[PH]Arachne", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;