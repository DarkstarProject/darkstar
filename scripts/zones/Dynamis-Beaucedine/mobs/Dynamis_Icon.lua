-----------------------------------
-- Area: Dynamis Beaucedine
-- NPC:  Dynamis Icon
-- Trigger for Wind Pukis respawn
-----------------------------------

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
    SpawnMob(17326325):updateEnmity(target);
    SpawnMob(17326323):updateEnmity(target);
    SpawnMob(17326295):updateEnmity(target);
    SpawnMob(17326319):updateEnmity(target);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;