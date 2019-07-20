-----------------------------------
-- Area: King Ranperres Tomb
--  Mob: Plague Bats
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 634, 1, dsp.regime.type.GROUNDS)
end