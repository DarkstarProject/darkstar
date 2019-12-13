-----------------------------------
-- Area: The Shrine of Ru'Avitau
--  Mob: Aura Pot
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 749, 1, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 751, 1, dsp.regime.type.GROUNDS)
end;