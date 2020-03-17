-----------------------------------
-- Area: Rolanberry Fields
--  Mob: Berry Grub
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 25, 2, tpz.regime.type.FIELDS)
    tpz.regime.checkRegime(player, mob, 86, 1, tpz.regime.type.FIELDS)
    tpz.regime.checkRegime(player, mob, 87, 1, tpz.regime.type.FIELDS)
end
