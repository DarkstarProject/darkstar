-----------------------------------
-- Area: The Eldieme Necropolis
--  MOB: Tomb Wolf
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 675, 1, dsp.regime.type.GROUNDS)
end;