-----------------------------------	
-- Area: Toraimarai Canal	
-- MOB:  Dark Aspic
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,619,3);
	checkRegime(killer,mob,620,1);
end;	
