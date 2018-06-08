-----------------------------------
-- Area: Crawlers Nest
--  MOB: Queen Crawler
-- !pos -337.156 -3.607 -253.294 197
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDespawn(mob)
    GetNPCByID(17584459):setStatus(dsp.status.NORMAL); -- qm5
end;

function onMobDeath(mob, player, isKiller)
end;