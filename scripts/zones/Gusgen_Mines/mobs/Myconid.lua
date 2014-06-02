-----------------------------------	
-- Area: Gusgen Mines
-- MOB:  Myconid
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,683,2);
end;	