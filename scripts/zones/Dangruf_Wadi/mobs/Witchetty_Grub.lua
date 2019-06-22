-----------------------------------
-- Area: Dangruf Wadi
--  MOB: Witchetty Grub
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 643, 1, dsp.regime.type.GROUNDS)
end;