-----------------------------------	
-- Area: King Ranperre's Tomb	
-- MOB:  Ogre Bat
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,638,2);
end;	
