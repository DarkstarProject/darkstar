-----------------------------------	
-- Area: King Ranperre's Tomb	
-- MOB:  Spartoi Sorcerer
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,638,1);
end;	
