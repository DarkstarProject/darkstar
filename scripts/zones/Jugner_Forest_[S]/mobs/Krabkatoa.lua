-----------------------------------
-- Area: Jugner_Forest_[S]
--  MOB: Krabkatoa
-----------------------------------
require("scripts/globals/titles");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.title.KRABKATOA_STEAMER);
end;