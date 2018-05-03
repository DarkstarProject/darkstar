-----------------------------------
-- Area: Beaucedine Glacier
--  MOB: Yilbegan
-----------------------------------
require("scripts/globals/titles");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.title.YILBEGAN_HIDEFLAYER);
end;