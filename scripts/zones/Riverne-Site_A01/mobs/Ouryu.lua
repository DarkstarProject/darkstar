-----------------------------------
-- Area: Riverne-Site_A01
--  MOB: Ouryu
-----------------------------------
require("scripts/globals/titles");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.title.OURYU_OVERWHELMER);
end;