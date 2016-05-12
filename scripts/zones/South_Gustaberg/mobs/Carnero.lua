----------------------------------
-- Area: South Gustaberg
--   NM: Carnero
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    -- Set Carnero's Window Open Time
    local wait = math.random(300,3600);
    SetServerVariable("[POP]Carnero", os.time(t) + wait); -- 5-60 minutes
    DeterMob(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Carnero");
    SetServerVariable("[PH]Carnero", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;