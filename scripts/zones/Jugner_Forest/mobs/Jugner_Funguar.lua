-----------------------------------
-- Area: Jugner Forest
--  Mob: Jugner Funguar
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 13, 1, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 14, 1, dsp.regime.type.FIELDS)
end
