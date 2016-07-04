-----------------------------------
-- Area: Uleguerand_Range
--  MOB: Geush Urvan
-- Notes: Spawned from qm1
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
    GetNPCByID(16798097):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
end;