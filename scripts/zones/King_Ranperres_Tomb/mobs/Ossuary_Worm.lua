-----------------------------------	
-- Area: King Ranperre's Tomb	
-- MOB:  Ossuary Worm	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,636,1);
end;	
