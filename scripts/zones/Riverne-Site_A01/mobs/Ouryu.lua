-----------------------------------
-- Area: Riverne - Site A01
--  Mob: Ouryu
-----------------------------------
require("scripts/globals/titles");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.title.OURYU_OVERWHELMER);
end;