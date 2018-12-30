-----------------------------------
-- Area: Crystal War Areas
--  MOB: Dark Ixion
-----------------------------------
require("scripts/globals/titles");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.title.IXION_HORNBREAKER);
end;