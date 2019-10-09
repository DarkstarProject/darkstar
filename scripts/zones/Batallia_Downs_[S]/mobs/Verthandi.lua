-----------------------------------
-- Area: Batallia_Downs_[S]
--  Mob: Verthandi
-----------------------------------
require("scripts/globals/titles");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.title.VERTHANDI_ENSNARER);
end;