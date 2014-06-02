-----------------------------------	
-- Area: Dangruf Wadi	
-- MOB:  Witchetty Grub	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,643,1);
end;	