-----------------------------------
-- Area: Gusgen Mines
--  Mob: Amphisbaena
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 682, 2, dsp.regime.type.GROUNDS)
end;