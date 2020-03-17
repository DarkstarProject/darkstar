-----------------------------------
-- Area: Ifrit's Cauldron
--  Mob: Volcanic Bomb
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 760, 2, tpz.regime.type.GROUNDS)
    tpz.regime.checkRegime(player, mob, 761, 2, tpz.regime.type.GROUNDS)
    tpz.regime.checkRegime(player, mob, 762, 2, tpz.regime.type.GROUNDS)
end