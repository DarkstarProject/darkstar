-----------------------------------
-- Area: The Boyahda Tree
--  MOB: Boyahda Sapling
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 725, 1, dsp.regime.type.GROUNDS)
end;