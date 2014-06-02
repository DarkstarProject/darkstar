-----------------------------------	
-- Area:  Temple Of Uggalepih
-- MOB:   Rumble Crawler	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,791,2);
end;	