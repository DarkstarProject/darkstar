----------------------------------
-- Area: South Gustaberg
--  NM:  Leaping Lizzy
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    -- Set LL's ToD
    SetServerVariable("[POP]Leaping_Lizzy", os.time(t) + 3600); -- 1 hour
    DeterMob(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Leaping_Lizzy");
    SetServerVariable("[PH]Leaping_Lizzy", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;