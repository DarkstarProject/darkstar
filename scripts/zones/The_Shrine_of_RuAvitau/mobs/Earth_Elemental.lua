-----------------------------------	
-- Area: Shrine of Ru'Avitau
-- MOB:  Earth Elemental	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,750,1);
end;	