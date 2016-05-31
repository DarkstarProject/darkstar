-----------------------------------
-- Area: East Ronfaure
--  MOB: Rambukk
-----------------------------------

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    UpdateNMSpawnPoint(mob:getID());
end;
