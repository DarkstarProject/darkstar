-----------------------------------
-- Area: Lufaise Meadows
--  MOB: Amaltheia
-- @pos 347.897 -10.895 264.382 24
-----------------------------------

-----------------------------------
-- OnMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end; 

-----------------------------------
-- OnMobDeath Action
-----------------------------------

function onMobDeath(mob,killer,ally)
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
    GetNPCByID(16875890):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
end;