-----------------------------------
-- Area: Outer Horutoto
--  MOB: Nine of Coins
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 668, 4, dsp.regime.type.GROUNDS)
end