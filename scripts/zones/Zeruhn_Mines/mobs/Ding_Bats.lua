-----------------------------------
-- Area: Zeruhn Mines (172)
--  Mob: Ding Bats
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 626, 1, dsp.regime.type.GROUNDS)
end