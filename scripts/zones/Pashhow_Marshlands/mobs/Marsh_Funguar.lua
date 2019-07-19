-----------------------------------
-- Area: Pashhow Marshlands
--  Mob: Marsh Funguar
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 24, 1, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 60, 2, dsp.regime.type.FIELDS)
end
