-----------------------------------
-- Area: Gustav Tunnel
--  Mob: Robber Crab
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 765, 1, dsp.regime.type.GROUNDS)
end;