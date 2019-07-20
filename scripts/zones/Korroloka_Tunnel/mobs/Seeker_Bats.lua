-----------------------------------
-- Area: Korroloka Tunnel
--  Mob: Seeker Bats
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 727, 2, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 728, 1, dsp.regime.type.GROUNDS)
end