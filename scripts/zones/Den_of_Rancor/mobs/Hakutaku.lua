-----------------------------------
-- Area: Den of Rancor
--  MOB: HakuTaku
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
    GetNPCByID(17433015):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
end;