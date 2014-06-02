-----------------------------------	
-- Area:  The Labyrinth of Onzozo
-- MOB:   Cockatrice
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,772,1);
	checkRegime(killer,mob,773,2);
end;	