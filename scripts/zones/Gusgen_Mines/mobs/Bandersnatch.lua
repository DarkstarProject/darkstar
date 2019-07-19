-----------------------------------
-- Area: Gusgen Mines
--  Mob: Bandersnatch
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 681, 2, dsp.regime.type.GROUNDS)
end;