-----------------------------------
-- Area: Ifrit's Cauldron
--  MOB: Bomb Queen
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
    GetNPCByID(17617180):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
end;