-----------------------------------
-- Area: Zeruhn Mines (172)
--  Mob: Colliery Bat
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 628, 1, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 629, 1, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 630, 1, dsp.regime.type.GROUNDS)
end