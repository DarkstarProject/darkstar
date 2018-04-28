-----------------------------------
-- Area: Konschtat Highlands
--  VNM: Yilbegan
-----------------------------------
require("scripts/globals/titles");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.titles.YILBEGAN_HIDEFLAYER);
end;