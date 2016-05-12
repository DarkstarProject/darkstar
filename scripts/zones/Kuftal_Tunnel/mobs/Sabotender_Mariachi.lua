----------------------------------
-- Area: Kuftal Tunnel
--   NM: Sabotender Mariachi
-- ToDo: Auto-Regen during the day
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    -- Set Sabotender Mariachi's Window Open Time
    local wait = math.random(10800,28800); -- 3-8 hours
    SetServerVariable("[POP]Sabotender_Mariachi", os.time(t) + wait); -- 3-8 hours
    DeterMob(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Sabotender_Mariachi");
    SetServerVariable("[PH]Sabotender_Mariachi", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;