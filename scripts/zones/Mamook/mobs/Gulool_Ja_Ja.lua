-----------------------------------
-- Area: Mamook
--  MOB: Gulool Ja Ja
-----------------------------------
require("scripts/globals/titles");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobEngaged(mob,target)

    SpawnMob(17043876):updateEnmity(target);
    SpawnMob(17043877):updateEnmity(target);
    SpawnMob(17043878):updateEnmity(target);
    SpawnMob(17043879):updateEnmity(target);

end;

function onMobDeath(mob, player, isKiller)
    player:addTitle(SHINING_SCALE_RIFLER);
end;