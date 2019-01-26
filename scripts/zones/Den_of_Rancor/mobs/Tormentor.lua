-----------------------------------
-- Area: Den of Rancor
--  MOB: Tormentor
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 802, 1, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 803, 1, dsp.regime.type.GROUNDS)
end;