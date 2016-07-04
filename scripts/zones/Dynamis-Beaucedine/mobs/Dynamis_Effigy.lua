-----------------------------------
-- Area: Dynamis Beaucedine
-- NPC:  Dynamis Effigy
-- Trigger for Petro Pukis respawn
-----------------------------------

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
    SpawnMob(17326179):updateEnmity(target);
    SpawnMob(17326135):updateEnmity(target);
    SpawnMob(17326156):updateEnmity(target);
    SpawnMob(17326168):updateEnmity(target);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;