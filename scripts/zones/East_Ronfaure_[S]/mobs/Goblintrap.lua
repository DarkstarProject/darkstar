-----------------------------------
-- Area: East Ronfaure [S]
--  MOB: Goblintrap
-- Note: Goblintrap NM
-- !pos 168 0 -440 81
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
    
    SetServerVariable("[POP]Goblintrap", os.time() + 3600);
    GetMobByID(mob:getID()):setRespawnTime(0);
    DisallowRespawn(mob:getID() - 1, false); --Let the Placeholder Respawn
    
end;
