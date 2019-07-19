-----------------------------------
-- Area: Everbloom Hollow
--  Mob: Lambton Worm
-----------------------------------
require("scripts/globals/titles");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.title.LAMBTON_WORM_DESEGMENTER);
end;