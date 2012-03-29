-----------------------------------
--  Area: West Ronfaure
--  MOB:  Orcs
-----------------------------------

require("/scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
	checkRegime(killer,mob,67,1);
end;