require("/scripts/globals/settings");
require("/scripts/globals/fieldsofvalor");
function OnMobSpawn(mob)
end;

function onMobDeath(mob,killer)
	checkRegime(killer,mob,74,2); --killer, mob, regime ID, index in the list of mobs to kill that this mob corresponds to (1-4)
end;