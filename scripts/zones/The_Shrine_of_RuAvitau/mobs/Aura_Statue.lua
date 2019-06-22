-----------------------------------
-- Area: Shrine of Ru'Avitau
--  MOB: Aura Statue
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 749, 1, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 754, 1, dsp.regime.type.GROUNDS)
end;