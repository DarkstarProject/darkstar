-----------------------------------
-- Area: Crawler's Nest
--  MOB: Drone Crawler
-- @pos 4.045 -2.703 285.026 (Spawn 1)
-- @pos -74.939 -2.606 244.139 197 (Spawn 2)
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
    if (mob:getID() == 17584131) then
        GetNPCByID(17584457):setStatus(STATUS_NORMAL); -- qm3
    elseif (mob:getID() == 17584132) then
        GetNPCByID(17584458):setStatus(STATUS_NORMAL); -- qm4
    end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;