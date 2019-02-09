-----------------------------------
-- Area: Outer Horutoto
--  MOB: Five of Coins
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 664, 4, dsp.regime.type.GROUNDS)
end