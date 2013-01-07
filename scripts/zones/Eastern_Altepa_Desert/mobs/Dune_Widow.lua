-----------------------------------
--  Area: Eastern Altepa Desert (114)
--    NM: Dune_Widow
-----------------------------------

require("/scripts/globals/fieldsofvalor");	

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)	

  checkRegime(killer,mob,109,1);

  -- Set Dune_Widow's Window Open Time
  wait = math.random((1),(5)) * 3600
  SetServerVariable("[POP]Dune_Widow", os.time(t) + wait); -- 1-5 hours
  
  -- Set PH back to normal, then set to respawn spawn
  PH = GetServerVariable("[PH]Dune_Widow");
  SetServerVariable("[PH]Dune_Widow", 0);
  DeterMob(PH, false);
  SpawnMob(PH, '', GetMobRespawnTime(PH));
  
end;

