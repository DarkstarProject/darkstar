-----------------------------------
-- Area: Gusgen Mines
--  MOB: Gallinipper
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 684, 2, dsp.regime.type.GROUNDS)
end;