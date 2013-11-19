----------------------------------	
-- Area: Cape Teriggan	
-- NM:   Frostmane
-----------------------------------	

-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	

    -- Set Frostmane's Window Open Time
    wait = math.random((3600),(21600)) -- 1-6 hours
    SetServerVariable("[POP]Frostmane", os.time(t) + wait); 
    DeterMob(mob:getID(), true);
    
    -- Set PH back to normal, then set to respawn spawn
    PH = GetServerVariable("[PH]Frostmane");
    SetServerVariable("[PH]Frostmane", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;