-----------------------------------
-- Area: Ifrit's Cauldron
--  Mob: Volcanic Bomb
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 760, 2, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 761, 2, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 762, 2, dsp.regime.type.GROUNDS)
end