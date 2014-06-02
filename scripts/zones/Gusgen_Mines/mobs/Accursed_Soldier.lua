-----------------------------------	
-- Area: Gusgen Mines
-- MOB:  Accursed Soldier
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,685,1);
end;	