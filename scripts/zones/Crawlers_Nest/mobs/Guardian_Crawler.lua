-----------------------------------
-- Area: Crawler's Nest
--  MOB: Guardian Crawler
-- !pos 124.335 -34.609 -75.373 197 (spawn area 1)
-- !pos 44.436 -2.602 195.381 197 (spawn area 2)
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDespawn(mob)
    if (mob:getID() == 17584129) then
        GetNPCByID(17584455):setStatus(STATUS_NORMAL); -- qm1
    elseif (mob:getID() == 17584130) then
        GetNPCByID(17584456):setStatus(STATUS_NORMAL); -- qm2
    end
end;

function onMobDeath(mob, player, isKiller)
end;