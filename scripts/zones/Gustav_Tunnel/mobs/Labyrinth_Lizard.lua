-----------------------------------
-- Area: Gustav Tunnel
--  Mob: Labyrinth Lizard
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 763, 1, dsp.regime.type.GROUNDS)
end;