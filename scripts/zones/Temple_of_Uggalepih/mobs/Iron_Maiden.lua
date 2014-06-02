-----------------------------------	
-- Area:  Temple Of Uggalepih
-- MOB:   Iron Maiden	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,795,2);
end;	