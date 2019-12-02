-----------------------------------
-- Area: Bostaunieux Oubliette
--  Mob: Wurdalak
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 617, 1, tpz.regime.type.GROUNDS)
end
