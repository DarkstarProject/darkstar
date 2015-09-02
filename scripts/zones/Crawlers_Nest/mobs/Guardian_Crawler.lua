-----------------------------------
-- Area: Crawler's Nest
-- NPC:  Guardian Crawler
-- @pos 124.335 -34.609 -75.373 197 (spawn area 1)
-- @pos 44.436 -2.602 195.381 197 (spawn area 2)
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
    if (mob:getID() == 17584129) then
        GetNPCByID(17584455):setStatus(STATUS_NORMAL); -- qm1
    elseif (mob:getID() == 17584130) then
        GetNPCByID(17584456):setStatus(STATUS_NORMAL); -- qm2
    end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
end;