----------------------------------	
-- Area: Cape Teriggan	
-- NM:  Kruetzet
-----------------------------------	

require("scripts/globals/weather");

-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
  
    -- Set Kruetzet's spawnpoint and respawn time (9-12 hours)
    UpdateNMSpawnPoint(mob:getID());
    mob:setRespawnTime(math.random((32400),(43200)));

end;

-----------------------------------	
-- onMobDisengage
-----------------------------------	

function onMobDisengage(mob, weather)
	
	if (weather ~= WEATHER_WIND and weather ~= WEATHER_GALE) then
		DespawnMob(mob:getID());
	end
	
end;