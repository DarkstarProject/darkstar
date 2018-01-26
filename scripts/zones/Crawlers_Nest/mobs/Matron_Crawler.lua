 -----------------------------------
-- Area: Crawler's Nest
--  MOB: Matron Crawler
-- !pos -141.158 -33.689 20.944 197
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDespawn(mob)
     GetNPCByID(17584460):setStatus(STATUS_NORMAL); -- qm6
end;

function onMobDeath(mob, player, isKiller)
end;