-----------------------------------
-- Area: West Ronfaure (100)
--  NM:  Fungus_Beetle
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    -- Set Fungus Beetle's Window Open Time, and disable respawn
    local wait = math.random(900,10800);
    SetServerVariable("[POP]Fungus_Beetle", os.time(t) + wait); -- 15 minutes - 3 hours
    DeterMob(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Fungus_Beetle");
    SetServerVariable("[PH]Fungus_Beetle", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;

