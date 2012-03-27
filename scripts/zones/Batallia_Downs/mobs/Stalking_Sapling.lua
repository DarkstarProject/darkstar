-----------------------------------
--  Area: Batallia Downs
--  MOB:  Stalking Sapling
-----------------------------------

require("/scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
	checkRegime(killer,mob,72,1);
	checkRegime(killer,mob,73,1);
end;