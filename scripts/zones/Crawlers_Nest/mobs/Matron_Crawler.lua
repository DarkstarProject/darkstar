 -----------------------------------
-- Area: Crawler's Nest
--  MOB: Matron Crawler
-- @pos -141.158 -33.689 20.944 197
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
     GetNPCByID(17584460):setStatus(STATUS_NORMAL); -- qm6
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;