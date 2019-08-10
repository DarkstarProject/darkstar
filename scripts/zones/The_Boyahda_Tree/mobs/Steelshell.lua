-----------------------------------
-- Area: The Boyahda Tree
--  Mob: Steelshell
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 723, 2, dsp.regime.type.GROUNDS)
end