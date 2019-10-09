-----------------------------------
-- Area: Gustav Tunnel
--  Mob: Doom Guard
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 765, 2, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 767, 1, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 768, 1, dsp.regime.type.GROUNDS)
end;