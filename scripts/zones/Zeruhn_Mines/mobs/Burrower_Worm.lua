-----------------------------------
-- Area: Zeruhn Mines (172)
--  Mob: Burrower Worm
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 629, 2, dsp.regime.type.GROUNDS)
end