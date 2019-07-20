-----------------------------------
-- Area: Jugner_Forest_[S]
--  Mob: Krabkatoa
-----------------------------------
require("scripts/globals/titles")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.title.KRABKATOA_STEAMER)
end