-----------------------------------
-- Area: Ifrit's Cauldron
--  MOB: Eotyrannus
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 758, 1, dsp.regime.type.GROUNDS)
end;