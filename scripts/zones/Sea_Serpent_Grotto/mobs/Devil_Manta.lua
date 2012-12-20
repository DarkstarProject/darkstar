-----------------------------------	
-- Area: Sea Serpent Grotto
--  MOB: Devil Manta
-- Note: Place holder Charybdis 
-----------------------------------	

require("/scripts/zones/Sea_Serpent_Grotto/MobIDs");
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
  
  mob = mob:getID();
  if (Charybdis_PH[mob] ~= nil) then

    Charybdis_ToD = GetServerVariable("[POP]Charybdis");
    if (Charybdis_ToD <= os.time(t) and GetMobAction(Charybdis) == 0 and math.random((10),(10)) == 10) then
      UpdateNMSpawnPoint(Charybdis);
      SpawnMob(Charybdis, "", GetMobRespawnTime(mob));
      SetServerVariable("[PH]Charybdis", mob);
      DeterMob(mob, true);
    else
      r = math.random((1),(2));
      if (mob ~= Charybdis_PH[r]) then
        DeterMob(mob, true);
        DeterMob(Charybdis_PH[r], false);
        SpawnMob(Charybdis_PH[r], "", GetMobRespawnTime(mob));
      end
    end
  end
  --printf("PH:17498522:%u",mob:getID());
end;	
