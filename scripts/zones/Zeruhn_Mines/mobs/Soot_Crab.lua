-----------------------------------
-- Area: Zeruhn Mines (172)
--  Mob: Soot Crab
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 628, 2, dsp.regime.type.GROUNDS)
end