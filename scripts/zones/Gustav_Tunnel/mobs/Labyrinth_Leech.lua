-----------------------------------
-- Area: Gustav Tunnel
--  Mob: Labyrinth Leech
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 763, 2, dsp.regime.type.GROUNDS)
end;