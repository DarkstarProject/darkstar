-----------------------------------	
-- Area: Labyrinth of Onzozo
--  MOB: Flying Manta
-- Note: Place holder Lord of Onzozo
-----------------------------------	

require("/scripts/zones/Labyrinth_of_Onzozo/MobIDs");
-- printf("PH:%u:%u",Mysticmaker_Profblix,Mysticmaker_Profblix);
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
  
  mob = mob:getID();
  if (Lord_of_Onzozo_PH[mob] ~= nil) then
  
    ToD = GetServerVariable("[POP]Lord_of_Onzozo");
    if (ToD <= os.time(t) and GetMobAction(Lord_of_Onzozo) == 0) then
      if (math.random((1),(25)) >= 5) then
        UpdateNMSpawnPoint(Lord_of_Onzozo);
        SpawnMob(Lord_of_Onzozo, "", GetMobRespawnTime(mob));
        SetServerVariable("[PH]Lord_of_Onzozo", mob);
        DeterMob(mob, true);
      end
    end
  end
end;	
