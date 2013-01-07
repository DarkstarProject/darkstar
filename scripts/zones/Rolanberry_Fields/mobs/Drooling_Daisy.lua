-----------------------------------
--  Area: Rolanberry Fields (110)
--    NM: Drooling_Daisy
-----------------------------------

require("/scripts/globals/fieldsofvalor");	

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)	

	checkRegime(killer,mob,88,1);
  
  -- Set Drooling_Daisy's Window Open Time
  SetServerVariable("[POP]Drooling_Daisy", os.time(t) + 3600); -- 1 hour
  
  -- Set PH back to normal, then set to respawn spawn
  PH = GetServerVariable("[PH]Drooling_Daisy");
  SetServerVariable("[PH]Drooling_Daisy", 0);
  DeterMob(PH, false);
  SpawnMob(PH, '', GetMobRespawnTime(PH));

end;

