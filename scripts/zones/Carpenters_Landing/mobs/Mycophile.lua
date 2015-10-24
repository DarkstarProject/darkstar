-----------------------------------
-- Area: Carpenters' Landing
-- Mob:  Mycophile
-----------------------------------

-----------------------------------
-- OnMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end; 

-----------------------------------
-- OnMobDeath Action
-----------------------------------

function onMobDeath(mob,killer)
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
    GetNPCByID(16785729):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
end;