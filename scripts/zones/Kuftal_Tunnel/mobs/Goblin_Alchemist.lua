-----------------------------------	
-- Area: Kuftal Tunnel
-- MOB:  Goblin Alchemist	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,740,2);
end;	