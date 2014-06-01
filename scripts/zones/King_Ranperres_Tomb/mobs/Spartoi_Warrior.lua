-----------------------------------	
-- Area: King Ranperre's Tomb	
-- MOB:  Spartoi Warrior
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,637,1);
end;	
