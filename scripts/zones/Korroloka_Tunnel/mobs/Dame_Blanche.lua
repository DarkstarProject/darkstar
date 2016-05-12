-----------------------------------
-- Area: Korroloka Tunnel (173)
--  NM:  Dame_Blanche
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    -- Set Dame_Blanche's Window Open Time
    local wait = math.random(7200,28800);
    SetServerVariable("[POP]Dame_Blanche", os.time(t) + wait); -- 1-8 hours
    DeterMob(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Dame_Blanche");
    SetServerVariable("[PH]Dame_Blanche", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;

