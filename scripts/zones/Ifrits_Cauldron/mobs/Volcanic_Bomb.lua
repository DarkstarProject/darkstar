-----------------------------------	
-- Area: Ifrit's Cauldron
-- MOB:  Volcanic Bomb	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,760,2);
	checkRegime(killer,mob,761,2);
	checkRegime(killer,mob,762,2);
end;	