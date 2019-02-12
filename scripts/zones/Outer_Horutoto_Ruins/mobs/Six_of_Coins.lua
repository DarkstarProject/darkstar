-----------------------------------
-- Area: Outer Horutoto
--  MOB: Six of Coins
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 665, 4, dsp.regime.type.GROUNDS)
end