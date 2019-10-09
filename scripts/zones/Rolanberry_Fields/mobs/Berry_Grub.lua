-----------------------------------
-- Area: Rolanberry Fields
--  Mob: Berry Grub
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 25, 2, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 86, 1, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 87, 1, dsp.regime.type.FIELDS)
end
