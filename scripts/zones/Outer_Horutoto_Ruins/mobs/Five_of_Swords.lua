-----------------------------------
-- Area: Outer Horutoto
--  MOB: Five of Swords
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 664, 3, dsp.regime.type.GROUNDS)
end