-----------------------------------
--  Area: Korroloka Tunnel (173)
--   Mob: Cargo_Crab_Colin
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)	

    -- Set Cargo_Crab_Colin's Window Open Time
    wait = math.random((7200),(21600));
    SetServerVariable("[POP]Cargo_Crab_Colin", os.time(t) + wait); -- 1-6 hours
    DeterMob(mob:getID(), true);
    
    -- Set PH back to normal, then set to respawn spawn
    PH = GetServerVariable("[PH]Cargo_Crab_Colin");
    SetServerVariable("[PH]Cargo_Crab_Colin", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;

