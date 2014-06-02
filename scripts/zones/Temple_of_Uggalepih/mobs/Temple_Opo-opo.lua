-----------------------------------	
-- Area:  Temple Of Uggalepih
-- MOB:   Temple Opo-opo	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,792,2);
end;	