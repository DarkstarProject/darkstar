-----------------------------------
-- Area: The Shrine of Ru'Avitau
--  Mob: Aura Gear
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 749, 1, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 752, 1, dsp.regime.type.GROUNDS)
end;