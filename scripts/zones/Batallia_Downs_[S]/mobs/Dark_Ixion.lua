-----------------------------------
-- Area: Batallia_Downs_[S]
--  Mob: Dark Ixion
-----------------------------------
require("scripts/globals/titles");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.title.IXION_HORNBREAKER);
end;