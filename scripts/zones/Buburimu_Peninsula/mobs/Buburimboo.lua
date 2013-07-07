-----------------------------------	
-- Area: Buburimu Peninsula	
-- MOB:  Buburimboo	
-----------------------------------	

-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	

    -- Set Buburimboo's Window Open Time
    wait = math.random((3600),(7200));
    SetServerVariable("[POP]Buburimboo", os.time(t) + wait); -- 1-2 hours
    DeterMob(mob:getID(), true);
    
    -- Set PH back to normal, then set to respawn spawn
    PH = GetServerVariable("[PH]Buburimboo");
    SetServerVariable("[PH]Buburimboo", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;	
