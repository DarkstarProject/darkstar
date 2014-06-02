-----------------------------------	
-- Area:  Temple Of Uggalepih
-- MOB:   Wespe	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,790,2);
end;	