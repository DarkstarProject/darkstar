-----------------------------------
-- Area: Temple Of Uggalepih
-- MOB:  Habetrot
-- @pos -60 -8 58 220
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
    GetNPCByID(17428871):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
end;