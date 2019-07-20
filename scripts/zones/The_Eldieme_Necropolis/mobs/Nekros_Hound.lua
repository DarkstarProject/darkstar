-----------------------------------
-- Area: The Eldieme Necropolis
--  Mob: Nekros Hound
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 677, 2, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 678, 2, dsp.regime.type.GROUNDS)
end;