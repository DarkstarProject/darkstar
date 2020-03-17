-----------------------------------
-- Area: West Sarutabaruta
--  Mob: Savanna Rarab
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 27, 1, tpz.regime.type.FIELDS)
end
