-----------------------------------
-- Area: Den of Rancor
--  MOB: Demonic Pugil
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 801, 1, dsp.regime.type.GROUNDS)
end;