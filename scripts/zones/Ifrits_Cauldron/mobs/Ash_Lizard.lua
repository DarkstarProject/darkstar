-----------------------------------
-- Area: Ifrit's Cauldron
--  MOB: Ash Lizard
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 761, 1, dsp.regime.type.GROUNDS)
end;