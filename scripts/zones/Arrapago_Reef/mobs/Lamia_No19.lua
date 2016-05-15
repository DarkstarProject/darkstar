-----------------------------------
-- Area: Arrapago Reef
--  MOB: Medusa
-----------------------------------

require("scripts/globals/titles");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobEngaged Action
-----------------------------------

function onMobEngaged(mob,target)

    SpawnMob(16998869,180):updateEnmity(target);
    SpawnMob(16998870,180):updateEnmity(target);

end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;