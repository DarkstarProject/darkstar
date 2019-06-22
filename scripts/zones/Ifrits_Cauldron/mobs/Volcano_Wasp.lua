-----------------------------------
-- Area: Ifrit's Cauldron
--  MOB: Volcano Wasp
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 755, 1, dsp.regime.type.GROUNDS)
end;