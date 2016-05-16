-----------------------------------
-- Area: Newton Movalpolos
--  MOB: Moblin Showman
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
    GetNPCByID(16826573):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
end;