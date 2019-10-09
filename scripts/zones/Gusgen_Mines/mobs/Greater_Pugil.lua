-----------------------------------
-- Area: Gusgen Mines
--  Mob: Greater Pugil
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 682, 1, dsp.regime.type.GROUNDS)
end;