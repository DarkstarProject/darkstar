-----------------------------------
-- Area: Riverne - Site B01
-- NPC:  Unstable Cluster
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
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
    GetNPCByID(16896175):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
end;