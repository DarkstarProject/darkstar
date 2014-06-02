-----------------------------------	
-- Area:  The Labyrinth of Onzozo
-- MOB:   Goblin Trader
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,771,2);
	checkRegime(killer,mob,772,2);
	checkRegime(killer,mob,774,2);
end;	