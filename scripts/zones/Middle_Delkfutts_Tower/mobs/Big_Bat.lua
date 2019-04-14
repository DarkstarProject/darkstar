-----------------------------------
-- Area: Middle Delkfutt's Tower
--  MOB: Big Bat
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 782, 2, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 783, 2, dsp.regime.type.GROUNDS)
end