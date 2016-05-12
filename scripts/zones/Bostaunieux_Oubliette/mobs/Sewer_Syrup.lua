-----------------------------------
-- Area: Bostaunieux Oubliette (167)
--  MOB: Sewer_Syrup
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    -- Set Sewer_Syrup's Window Open Time
    local wait = math.random(7200,14400);
    SetServerVariable("[POP]Sewer_Syrup", os.time(t) + wait); -- 2-4 hours
    DeterMob(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Sewer_Syrup");
    SetServerVariable("[PH]Sewer_Syrup", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;

