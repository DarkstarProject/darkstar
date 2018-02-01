-----------------------------------
-- Area: Jugner Forest
--  VNM: Krabkatoa
-----------------------------------
require("scripts/globals/titles");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
    player:addTitle(KRABKATOA_STEAMER);
end;