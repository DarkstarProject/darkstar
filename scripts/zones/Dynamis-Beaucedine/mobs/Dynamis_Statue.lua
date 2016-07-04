-----------------------------------
-- Area: Dynamis Beaucedine
-- NPC:  Dynamis Statue
-- Trigger for Poison Pukis respawn
-----------------------------------

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
    SpawnMob(17326458):updateEnmity(target);
    SpawnMob(17326446):updateEnmity(target);
    SpawnMob(17326374):updateEnmity(target);
    SpawnMob(17326415):updateEnmity(target);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;