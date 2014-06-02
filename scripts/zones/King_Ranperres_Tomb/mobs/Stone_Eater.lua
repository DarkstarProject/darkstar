-----------------------------------	
-- Area: King Ranperre's Tomb	
-- MOB:  Stone Eater	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,632,1);
end;	
