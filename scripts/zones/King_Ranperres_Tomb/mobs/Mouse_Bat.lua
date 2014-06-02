-----------------------------------	
-- Area: King Ranperre's Tomb	
-- MOB:  Mouse Bat	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,631,1);
end;	
