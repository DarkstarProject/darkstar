----------------------------------	
-- Area: Kuftal Tunnel	
--   NM: Bloodthirster Madkix
-----------------------------------	
  
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
  
  -- Set Bloodthirster Madkix's Window Open Time
  wait = math.random((2),(8)) * 3600
  SetServerVariable("[POP]Bloodthirster_Madkix", os.time(t) + wait); -- 2-8 hours
  
  -- Set PH back to normal, then set to respawn spawn
  PH = GetServerVariable("[PH]Bloodthirster_Madkix");
  SetServerVariable("[PH]Bloodthirster_Madkix", 0);
  DeterMob(PH, false);
  SpawnMob(PH, '', GetMobRespawnTime(PH));
  
end;