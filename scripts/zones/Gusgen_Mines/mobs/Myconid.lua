-----------------------------------
-- Area: Gusgen Mines
--  MOB: Myconid
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 683, 2, dsp.regime.type.GROUNDS)
end;