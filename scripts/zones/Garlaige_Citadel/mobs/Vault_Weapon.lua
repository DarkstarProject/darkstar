-----------------------------------	
-- Area: Garlaige Citadel
-- MOB:  Vault Weapon	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,705,1);
	checkRegime(killer,mob,708,2);
end;	