-----------------------------------	
-- Area: Labyrinth of Onzozo
--  MOB: Goblin Shepherd
-- Note: Place holder Soulstealer Skullnix
-----------------------------------	

require("/scripts/zones/Labyrinth_of_Onzozo/MobIDs");
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
  
  mob = mob:getID();
  if (Soulstealer_Skullnix_PH[mob] ~= nil) then
  
    ToD = GetServerVariable("[POP]Soulstealer_Skullnix");
    if (ToD <= os.time(t) and GetMobAction(Soulstealer_Skullnix) == 0) then
      if (math.random((1),(20)) == 5) then
        UpdateNMSpawnPoint(Soulstealer_Skullnix);
        SpawnMob(Soulstealer_Skullnix, "", GetMobRespawnTime(mob));
        SetServerVariable("[PH]Soulstealer_Skullnix", mob);
        DeterMob(mob, true);
      end
    end
  end
end;	