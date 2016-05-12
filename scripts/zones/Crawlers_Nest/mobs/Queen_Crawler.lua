-----------------------------------
-- Area: Crawlers Nest
--  MOB: Queen Crawler
-- @pos -337.156 -3.607 -253.294 197
-----------------------------------


-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
    GetNPCByID(17584459):setStatus(STATUS_NORMAL); -- qm5
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;