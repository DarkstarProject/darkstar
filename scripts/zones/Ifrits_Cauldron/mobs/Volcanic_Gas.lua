-----------------------------------
-- Area: Ifrit's Cauldron
--  Mob: Volcanic Gas
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 755, 2, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 756, 2, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 757, 2, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 758, 2, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 759, 1, dsp.regime.type.GROUNDS)
end