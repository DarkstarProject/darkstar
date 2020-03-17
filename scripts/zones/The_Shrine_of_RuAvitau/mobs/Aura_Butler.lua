-----------------------------------
-- Area: The Shrine of Ru'Avitau
--  Mob: Aura Butler
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 749, 1, tpz.regime.type.GROUNDS)
    tpz.regime.checkRegime(player, mob, 752, 1, tpz.regime.type.GROUNDS)
end;