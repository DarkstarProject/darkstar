-----------------------------------
-- Area: The Shrine of Ru'Avitau
--  MOB: Olla Pequena
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
    SpawnMob(mob:getID() + 1,180):updateEnmity(killer);
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
    if (GetMobAction(mob:getID() + 1) == 0) then -- if this Pequena despawns and Media is not alive, it would be because it despawned outside of being killed.
        GetNPCByID(17506692):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
    end
end;