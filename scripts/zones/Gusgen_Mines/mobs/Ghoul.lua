-----------------------------------
-- Area: Gusgen Mines
--  Mob: Ghoul
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 679, 1, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 680, 2, dsp.regime.type.GROUNDS)
end;