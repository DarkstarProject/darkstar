-----------------------------------
--  Area: Western Altepa Desert (125)
--    NM: Cactuar_Cantautor
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)	

    -- Set Cactuar_Cantautor's Window Open Time
    wait = math.random((1),(12)) * 3600
    SetServerVariable("[POP]Cactuar_Cantautor", os.time(t) + wait); -- 1-12 hours
    DeterMob(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    PH = GetServerVariable("[PH]Cactuar_Cantautor");
    SetServerVariable("[PH]Cactuar_Cantautor", 0);
    DeterMob(PH, false);
    SpawnMob(PH, '', GetMobRespawnTime(PH));
  
end;

