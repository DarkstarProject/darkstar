-----------------------------------	
-- Area: Bostaunieux Oubliette	
-- MOB:  Nachtmahr	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,616,1);
end;	
