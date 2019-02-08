-----------------------------------
-- Area: Outer Horutoto
--  MOB: Four Of Cups
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 663, 1, dsp.regime.type.GROUNDS)
end