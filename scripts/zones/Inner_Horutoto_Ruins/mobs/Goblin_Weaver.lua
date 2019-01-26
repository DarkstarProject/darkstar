-----------------------------------
-- Area: Inner Horutoto Ruins
--  MOB: Goblin Weaver
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 648, 2, dsp.regime.type.GROUNDS)
end;