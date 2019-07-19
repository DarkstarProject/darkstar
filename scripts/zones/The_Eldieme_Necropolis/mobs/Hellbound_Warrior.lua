-----------------------------------
-- Area: The Eldieme Necropolis
--  Mob: Hellbound Warrior
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 671, 1, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 675, 2, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 677, 1, dsp.regime.type.GROUNDS)
end;