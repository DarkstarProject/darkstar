-----------------------------------
-- Area: Den of Rancor
--  MOB: Doom Toad
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 801, 2, dsp.regime.type.GROUNDS)
end;