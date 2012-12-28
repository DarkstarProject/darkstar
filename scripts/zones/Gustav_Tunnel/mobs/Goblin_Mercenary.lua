----------------------------------	
-- Area: Gustav Tunnel	
--  MOB: Goblin Mercenary
-- Note: Place holder Wyvernpoacher Drachlox
-----------------------------------	

require("/scripts/zones/Gustav_Tunnel/MobIDs");
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
  
  mob = mob:getID();
  if (Wyvernpoacher_Drachlox_PH[mob] ~= nil) then
  
    ToD = GetServerVariable("[POP]Wyvernpoacher_Drachlox");
    if (ToD <= os.time(t) and GetMobAction(Wyvernpoacher_Drachlox) == 0) then
      if (math.random((1),(20)) == 5) then
        UpdateNMSpawnPoint(Wyvernpoacher_Drachlox);
        SpawnMob(Wyvernpoacher_Drachlox, "", GetMobRespawnTime(mob));
        SetServerVariable("[PH]Wyvernpoacher_Drachlox", mob);
        DeterMob(mob, true);
      end
    end
  end
  
end;	
