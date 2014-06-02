-----------------------------------	
-- Area: Ve'Lugannon Palace
-- MOB:  Ornamental Weapon
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,744,1);
end;	