-----------------------------------	
-- Area:  Temple Of Uggalepih
-- MOB:   Temple Bee	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,790,2);
	checkRegime(killer,mob,793,2);
end;	