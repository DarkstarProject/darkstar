-----------------------------------
-- Area: The Boyahda Tree
--  MOB: Moss Eater
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 721, 2, dsp.regime.type.GROUNDS)
end;