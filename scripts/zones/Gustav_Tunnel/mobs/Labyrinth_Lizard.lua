-----------------------------------	
-- Area: Gustav Tunnel
-- MOB:  Labyrinth Lizard	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,763,1);
end;	