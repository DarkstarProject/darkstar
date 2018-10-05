-----------------------------------
-- Area: Ifrit's Cauldron
--  MOB: Sulfur Scorpion
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 759, 2, dsp.regime.type.GROUNDS)
end;