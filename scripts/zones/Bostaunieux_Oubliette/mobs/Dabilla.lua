-----------------------------------
-- Area: Bostaunieux Oubliette
--  Mob: Dabilla
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 612, 1, tpz.regime.type.GROUNDS)
    tpz.regime.checkRegime(player, mob, 614, 1, tpz.regime.type.GROUNDS)
end
