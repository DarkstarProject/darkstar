----------------------------------	
-- Area: Valkurm Dunes	
--   NM: Valkurm Emperor 
-----------------------------------	

require("/scripts/globals/fieldsofvalor");	
  
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	

	checkRegime(killer,mob,9,1);
	checkRegime(killer,mob,10,2);
  
  -- Set VE's Window Open Time
  SetServerVariable("[POP]Valkurm_Emperor", os.time(t) + 3600); -- 1 hour 
  
  -- Set PH back to normal, then set to respawn spawn
  PH = GetServerVariable("[PH]Valkurm_Emperor");
  SetServerVariable("[PH]Valkurm_Emperor", 0);
  DeterMob(PH, false);
  SpawnMob(PH, '', GetMobRespawnTime(PH));
  
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function OnMobDespawn(mob)
    SetServerVariable("[POP]Valkurm_Emperor", os.time(t) + 3600); -- 1 hour

	-- Set PH back to normal, then set to respawn spawn
	PH = GetServerVariable("[PH]Valkurm_Emperor");
	SetServerVariable("[PH]Valkurm_Emperor", 0);
	DeterMob(PH, false);
	SpawnMob(PH, '', GetMobRespawnTime(PH));
end;
