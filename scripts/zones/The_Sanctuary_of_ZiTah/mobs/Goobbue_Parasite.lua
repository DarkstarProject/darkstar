-----------------------------------
-- Area: The Sanctuary of ZiTah
--  Mob: Goobbue Parasite
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 116, 1, tpz.regime.type.FIELDS)
    tpz.regime.checkRegime(player, mob, 117, 2, tpz.regime.type.FIELDS)
end
