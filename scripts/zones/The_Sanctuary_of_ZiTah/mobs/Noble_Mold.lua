-----------------------------------
-- Area: The Sanctuary of Zi'Tah
--  Mob: Noble Mold
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 115, 1, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 116, 2, dsp.regime.type.FIELDS)
end
