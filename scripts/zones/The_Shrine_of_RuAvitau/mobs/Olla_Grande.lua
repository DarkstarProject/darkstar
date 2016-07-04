-----------------------------------
-- Area: The Shrine of Ru'Avitau
--  MOB: Olla Grande
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
    GetNPCByID(17506692):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
end;