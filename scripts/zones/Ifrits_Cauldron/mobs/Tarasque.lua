-----------------------------------
-- Area: Ifrit's Cauldron
-- NPC:  Tarasque
-- @pos 124 19 163 100
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
    GetNPCByID(17617179):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
end;