-----------------------------------	
-- Area:  The Labyrinth of Onzozo
-- MOB:   Labyrinth Leech	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,771,1);
end;	