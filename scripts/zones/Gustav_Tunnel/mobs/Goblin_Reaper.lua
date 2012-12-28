----------------------------------	
-- Area: Gustav Tunnel	
--  MOB: Goblin Reaper
-- Note: Place holder Goblinsavior Heronox
-----------------------------------	

require("/scripts/zones/Gustav_Tunnel/MobIDs");
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
  
  mob = mob:getID();
  if (Goblinsavior_Heronox_PH[mob] ~= nil) then
  
    ToD = GetServerVariable("[POP]Goblinsavior_Heronox");
    if (ToD <= os.time(t) and GetMobAction(Goblinsavior_Heronox) == 0) then
      if (math.random((1),(20)) == 5) then
        UpdateNMSpawnPoint(Goblinsavior_Heronox);
        SpawnMob(Goblinsavior_Heronox, "", GetMobRespawnTime(mob));
        SetServerVariable("[PH]Goblinsavior_Heronox", mob);
        DeterMob(mob, true);
      end
    end
  end
  
end;	
