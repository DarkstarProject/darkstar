-----------------------------------
-- Area: Temple of Uggalepih
--  Mob: Temple Opo-opo
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 792, 2, tpz.regime.type.GROUNDS)
end