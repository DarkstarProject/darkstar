----------------------------------	
-- Area: Kuftal Tunnel	
--   NM: Sabotender Mariachi
-- ToDo: Auto-Regen during the day
-----------------------------------	
  
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	

    -- Set Sabotender Mariachi's Window Open Time
    wait = math.random((3),(8)) * 3600
    SetServerVariable("[POP]Sabotender_Mariachi", os.time(t) + wait); -- 3-8 hours
    DeterMob(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    PH = GetServerVariable("[PH]Sabotender_Mariachi");
    SetServerVariable("[PH]Sabotender_Mariachi", 0);
    DeterMob(PH, false);
    SpawnMob(PH, '', GetMobRespawnTime(PH));
  
end;