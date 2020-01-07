-----------------------------------
-- Area: Jugner Forest
--  Mob: Screamer
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 58, 2, dsp.regime.type.FIELDS)
end
