-----------------------------------
-- Area: Gusgen Mines
--  Mob: Ore Eater
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 681, 1, dsp.regime.type.GROUNDS)
end;