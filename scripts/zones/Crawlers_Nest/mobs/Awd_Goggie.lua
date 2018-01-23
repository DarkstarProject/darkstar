-----------------------------------
-- Area: Crawler's Nest
--  MOB: Awd Goggie
-- !pos -253.026 -1.867 253.055 197
-----------------------------------
require("scripts/globals/titles");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDespawn(mob)
     GetNPCByID(17584461):setStatus(STATUS_NORMAL); -- qm7
end;

function onMobDeath(mob, player, isKiller)
    player:addTitle(BOGEYDOWNER);
end;