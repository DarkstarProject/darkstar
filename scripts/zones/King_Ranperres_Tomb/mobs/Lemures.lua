-----------------------------------
-- Area: King Ranperres Tomb
--  MOB: Lemures
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 636, 2, dsp.regime.type.GROUNDS)
end