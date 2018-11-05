-----------------------------------
-- Area: Inner Horutoto Ruins
--  MOB: Goblin Lurcher
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 654, 1, dsp.regime.type.GROUNDS)
end;