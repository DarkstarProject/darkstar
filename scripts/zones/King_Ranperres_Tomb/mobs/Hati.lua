-----------------------------------
-- Area: King Ranperres Tomb
--  MOB: Hati
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 637, 2, dsp.regime.type.GROUNDS)
end;