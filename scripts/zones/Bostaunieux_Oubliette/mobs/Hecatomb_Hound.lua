-----------------------------------
-- Area: Bostaunieux Oubliette
--  Mob: Hecatomb Hound
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 612, 1, tpz.regime.type.GROUNDS)
end
