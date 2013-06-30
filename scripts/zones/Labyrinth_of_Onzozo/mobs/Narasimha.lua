----------------------------------	
-- Area: Labyrinth of Onzozo
--   NM: Narasimha
-----------------------------------	
  
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
  
    -- Set Narasimha's Window Open Time
    wait = math.random((6),(10)) * 3600
    SetServerVariable("[POP]Narasimha", os.time(t) + wait); -- 6-10 hours
    DeterMob(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    PH = GetServerVariable("[PH]Narasimha");
    SetServerVariable("[PH]Narasimha", 0);
    DeterMob(PH, false);
    SpawnMob(PH, '', GetMobRespawnTime(PH));
  
end;