-----------------------------------
-- Area: Jugner Forest
--  Mob: Forest Leech
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 11, 1, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 12, 2, dsp.regime.type.FIELDS)
end
