-----------------------------------
-- Area: Korroloka Tunnel (173)
--  NM:  Cargo Crab Colin
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    -- Set Cargo_Crab_Colin's Window Open Time
    local wait = math.random(7200,21600);
    SetServerVariable("[POP]Cargo_Crab_Colin", os.time(t) + wait); -- 1-6 hours
    DeterMob(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Cargo_Crab_Colin");
    SetServerVariable("[PH]Cargo_Crab_Colin", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;

