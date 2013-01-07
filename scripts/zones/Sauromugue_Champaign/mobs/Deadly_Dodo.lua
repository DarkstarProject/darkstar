-----------------------------------
--  Area: Sauromugue Champaign (120)
--   Mob: Deadly_Dodo
-----------------------------------

require("/scripts/globals/fieldsofvalor");	

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)	

  checkRegime(killer,mob,100,1);
  
  -- Set Deadly_Dodo's Window Open Time
  SetServerVariable("[POP]Deadly_Dodo", os.time(t) + 3600); -- 1 hour
  
  -- Set PH back to normal, then set to respawn
  PH = GetServerVariable("[PH]Deadly_Dodo");
  SetServerVariable("[PH]Deadly_Dodo", 0);
  DeterMob(PH, false);
  SpawnMob(PH, '', GetMobRespawnTime(PH));
  
end;

