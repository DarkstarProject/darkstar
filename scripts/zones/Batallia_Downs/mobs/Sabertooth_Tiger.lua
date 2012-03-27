require("/scripts/globals/settings");
require("/scripts/globals/fieldsofvalor");
function OnMobSpawn(mob)
end;

function onMobDeath(mob,killer)
	checkRegime(killer,mob,74,1); --killer, regime ID, index in the list of mobs to kill that this mob corresponds to (1-4)
	checkRegime(killer,mob,75,1);
end;