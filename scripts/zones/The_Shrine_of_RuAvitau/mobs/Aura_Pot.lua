-----------------------------------	
-- Area: Shrine of Ru'Avitau
-- MOB:  Aura Pot	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,749,1);
	checkRegime(killer,mob,751,1);
end;	