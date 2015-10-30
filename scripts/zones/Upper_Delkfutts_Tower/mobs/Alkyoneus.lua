-----------------------------------
-- Area: Upper Delkfutt's Tower
-- NPC:  Alkyoneus
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
    GetNPCByID(17424518):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
end;