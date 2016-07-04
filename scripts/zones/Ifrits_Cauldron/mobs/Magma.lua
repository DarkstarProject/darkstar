-----------------------------------
-- Area: Ifrit's Cauldron
--  MOB: Magma
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
    GetNPCByID(17617214):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
end;