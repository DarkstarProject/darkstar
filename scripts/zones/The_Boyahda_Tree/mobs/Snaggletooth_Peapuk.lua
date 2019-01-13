-----------------------------------
-- Area: The Boyahda Tree
--  MOB: Snaggletooth Peapuk
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 726, 2, dsp.regime.type.GROUNDS)
end