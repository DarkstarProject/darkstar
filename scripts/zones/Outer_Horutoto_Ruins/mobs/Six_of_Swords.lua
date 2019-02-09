-----------------------------------
-- Area: Outer Horutoto
--  MOB: Six of Swords
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 665, 3, dsp.regime.type.GROUNDS)
end