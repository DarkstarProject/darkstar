-----------------------------------	
-- Area: Shrine of Ru'Avitau
-- MOB:  Aura Gear	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,749,1);
	checkRegime(killer,mob,752,1);
end;	