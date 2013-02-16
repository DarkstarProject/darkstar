----------------------------------
-- Area: Kuftal Tunnel
--   NM: Arachne
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)

  -- Set Arachne's Window Open Time
  wait = math.random((2),(8)) * 3600
  SetServerVariable("[POP]Arachne", os.time(t) + wait); -- 2-8 hours

  -- Set PH back to normal, then set to respawn spawn
  PH = GetServerVariable("[PH]Arachne");
  SetServerVariable("[PH]Arachne", 0);
  DeterMob(PH, false);
  SpawnMob(PH, '', GetMobRespawnTime(PH));

end;