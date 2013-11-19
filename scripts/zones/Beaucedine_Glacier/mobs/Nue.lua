-----------------------------------
--  Area: Beaucedine Glacier (111)
--  NM:	  Nue
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)	

    -- Set Nue's Window Open Time
    wait = math.random((3600),(7200));
    SetServerVariable("[POP]Nue", os.time(t) + wait); -- 1-2 hours
    DeterMob(mob:getID(), true);
    
    -- Set PH back to normal, then set to respawn spawn
    PH = GetServerVariable("[PH]Nue");
    SetServerVariable("[PH]Nue", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;

