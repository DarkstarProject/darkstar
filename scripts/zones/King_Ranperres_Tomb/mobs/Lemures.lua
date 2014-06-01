-----------------------------------	
-- Area: King Ranperre's Tomb	
-- MOB:  Lemures	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,636,2);
end;	
