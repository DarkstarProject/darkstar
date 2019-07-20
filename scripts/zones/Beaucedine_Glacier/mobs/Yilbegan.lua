-----------------------------------
-- Area: Beaucedine Glacier
--  Mob: Yilbegan
-----------------------------------
require("scripts/globals/titles");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.title.YILBEGAN_HIDEFLAYER);
end;