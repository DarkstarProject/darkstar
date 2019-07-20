-----------------------------------
-- Area: Pashhow Marshlands
--  Mob: Gadfly
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 21, 1, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 22, 2, dsp.regime.type.FIELDS)
end
