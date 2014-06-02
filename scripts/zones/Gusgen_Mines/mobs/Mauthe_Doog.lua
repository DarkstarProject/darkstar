-----------------------------------	
-- Area: Gusgen Mines
-- MOB:  Mauthe Doog
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,682,3);
end;	