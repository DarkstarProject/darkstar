-----------------------------------
-- Area: Castle Zvahl Keep (162)
--  Mob: Baron Vapula
-----------------------------------
require("scripts/globals/titles");


function onMobDeath(mob, player, isKiller)
    player:addTitle(tpz.title.HELLSBANE);
end;
