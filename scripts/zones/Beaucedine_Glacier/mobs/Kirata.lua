-----------------------------------
--  Area: Beaucedine Glacier (111)
--  Mob:  Kirata
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)	

    -- Set Kirata's Window Open Time
    wait = math.random((3600),(28800));
    SetServerVariable("[POP]Kirata", os.time(t) + wait); -- 1-8 hours
    DeterMob(mob:getID(), true);
    
    -- Set PH back to normal, then set to respawn spawn
    PH = GetServerVariable("[PH]Kirata");
    SetServerVariable("[PH]Kirata", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;

