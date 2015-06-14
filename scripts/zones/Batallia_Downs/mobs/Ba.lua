-----------------------------------
-- Area: Batallia Downs
-- MOB:  Ba
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
	checkRegime(killer,mob,15,2);
	checkRegime(killer,mob,73,2);
end;
