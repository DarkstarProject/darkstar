-----------------------------------	
-- Area: Shrine of Ru'Avitau
-- MOB:  Aura Statue	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,749,1);
	checkRegime(killer,mob,754,1);
end;	