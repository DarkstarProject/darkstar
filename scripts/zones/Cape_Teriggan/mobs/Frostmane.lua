----------------------------------	
-- Area: Cape Teriggan	
--   NM: Frostmane
-----------------------------------	

-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	

    -- Set Frostmane's Window Open Time
    wait = math.random((1),(6)) * 3600
    SetServerVariable("[POP]Frostmane", os.time(t) + wait); -- 1-6 hours
    DeterMob(mob:getID(), true);
    
    -- Set PH back to normal, then set to respawn spawn
    PH = GetServerVariable("[PH]Frostmane");
    SetServerVariable("[PH]Frostmane", 0);
    DeterMob(PH, false);
    SpawnMob(PH, '', GetMobRespawnTime(PH));

end;