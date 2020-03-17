-----------------------------------
-- Area: Bostaunieux Oubliette
--  Mob: Nachtmahr
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 616, 1, tpz.regime.type.GROUNDS)
end
