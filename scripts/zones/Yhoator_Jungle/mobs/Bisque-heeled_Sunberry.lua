-----------------------------------	
-- Area: Yhoator Jungle	
-- MOB:  Bisque-heeled Sunberry	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,133,1);
	kills = killer:getVar("EVERYONES_GRUDGE_KILLS");
	if(kills < 480) then
		killer:setVar("EVERYONES_GRUDGE_KILLS",kills + 1);
	end
    
    -- Set Bisque-heeled Sunberry's spawnpoint and respawn time (1-2 hours)
    UpdateNMSpawnPoint(mob:getID());
    mob:setRespawnTime(math.random((3600),(7200)));
    
end;	
