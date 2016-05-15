-----------------------------------
-- Area: Bostaunieux Oubliette (167)
--  MOB: Shii
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    -- Set Shii's Window Open Time
    local wait = math.random((14400),(28800));
    SetServerVariable("[POP]Shii", os.time(t) + wait); -- 4-8 hours
    DeterMob(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Shii");
    SetServerVariable("[PH]Shii", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;

