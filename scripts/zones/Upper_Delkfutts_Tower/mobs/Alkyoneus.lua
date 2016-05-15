-----------------------------------
-- Area: Upper Delkfutt's Tower
--  MOB: Alkyoneus
-----------------------------------

-----------------------------------
-- OnMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end; 

-----------------------------------
-- OnMobDeath Action
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
    GetNPCByID(17424518):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
end;