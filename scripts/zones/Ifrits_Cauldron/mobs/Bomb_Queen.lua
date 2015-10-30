-----------------------------------
-- Area: Ifrit's Cauldron
-- NPC:  Bomb Queen
-----------------------------------

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
    GetNPCByID(17617180):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
end;