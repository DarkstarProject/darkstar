-----------------------------------
-- Area: King Ranperres Tomb
--  MOB: Plague Bats
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobInitialize(mob)
end;

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 634, 1, dsp.regime.type.GROUNDS)
end;