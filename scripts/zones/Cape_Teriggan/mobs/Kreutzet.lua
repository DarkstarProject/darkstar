----------------------------------	
-- Area: Cape Teriggan	
--   NM: Kruetzet
-----------------------------------	
require("scripts/globals/weather");
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
  
  -- Set Kruetzet's spawnpoint and respawn time (9-12 hours)
  Kruetzet = mob:getID();
  UpdateNMSpawnPoint(Kruetzet);
  SpawnMob(Kruetzet, '', math.random((32400),(43200)));

end;

function onMobDisengage(mob, weather)
	
	if(weather ~= WEATHER_WIND or weather ~= WEATHER_GALE) then
		DespawnMob(mob:getID());
	end
	
end;