-----------------------------------
-- Area: Korroloka Tunnel
--  Mob: Jelly
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 729, 2, dsp.regime.type.GROUNDS)
end