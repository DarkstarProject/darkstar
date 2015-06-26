-----------------------------------
-- Area: Batallia Downs
-- MOB:  May Fly
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
	checkRegime(killer,mob,15,1);
	checkRegime(killer,mob,72,2);
end;
