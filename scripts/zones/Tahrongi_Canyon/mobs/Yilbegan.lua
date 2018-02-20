-----------------------------------
-- Area: Tahrongi Canyon
--  VNM: Yilbegan
-----------------------------------
require("scripts/globals/titles");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
    player:addTitle(YILBEGAN_HIDEFLAYER);
end;