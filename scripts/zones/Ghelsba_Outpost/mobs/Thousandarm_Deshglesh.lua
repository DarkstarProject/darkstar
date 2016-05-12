-----------------------------------
-- Area: Ghelsba Outpost (140)
--  NM:  Thousandarm_Deshglesh
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    -- Set Thousandarm_Deshglesh's Window Open Time
    local wait = math.random(3600,10800);
    SetServerVariable("[POP]Thousandarm_Deshglesh", os.time(t) + wait); -- 1-3 hours
    DeterMob(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Thousandarm_Deshglesh");
    SetServerVariable("[PH]Thousandarm_Deshglesh", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;

