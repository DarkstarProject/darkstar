-----------------------------------
-- Area: The Eldieme Necropolis
--  Mob: Spriggan
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 672, 1, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 673, 1, dsp.regime.type.GROUNDS)
end;