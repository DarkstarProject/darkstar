-----------------------------------
-- Area: Bostaunieux Oubliette
--  Mob: Haunt
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 612, 2, tpz.regime.type.GROUNDS)
end
