-----------------------------------
-- Area: Ifrit's Cauldron
--  MOB: Nightmare Bats
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 760, 1, dsp.regime.type.GROUNDS)
end;