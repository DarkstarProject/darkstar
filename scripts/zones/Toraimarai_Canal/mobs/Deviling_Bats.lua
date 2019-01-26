-----------------------------------
-- Area: Toraimorai Canal
--  MOB: Deviling Bat
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 622, 2, dsp.regime.type.GROUNDS)
end
