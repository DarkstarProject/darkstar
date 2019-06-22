-----------------------------------
-- Area: Gustav Tunnel
--  MOB: Pygmytoise
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 770, 2, dsp.regime.type.GROUNDS)
end;