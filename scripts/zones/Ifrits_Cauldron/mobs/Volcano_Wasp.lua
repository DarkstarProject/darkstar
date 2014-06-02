-----------------------------------	
-- Area: Ifrit's Cauldron
-- MOB:  Volcano Wasp	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,755,1);
end;	