-----------------------------------
--  Area: West Ronfaure
--  MOB:  Carrion Worm
-----------------------------------

require("/scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
	checkRegime(killer,mob,65,1);
end;