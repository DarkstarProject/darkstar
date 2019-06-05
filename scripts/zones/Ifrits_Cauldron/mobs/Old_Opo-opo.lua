-----------------------------------
-- Area: Ifrit's Cauldron
--  MOB: Old Opo-opo
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 756, 1, dsp.regime.type.GROUNDS)
end;