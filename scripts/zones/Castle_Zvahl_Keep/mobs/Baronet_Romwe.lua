-----------------------------------
-- Area: Castle Zvahl Keep (162)
--  Mob: Baronet Romwe
-----------------------------------
require("scripts/globals/titles");

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.title.HELLSBANE);
end;
