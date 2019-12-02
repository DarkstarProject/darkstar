-----------------------------------
-- Area: South Gustaberg
--  Mob: Passage Crab
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 80, 2, tpz.regime.type.FIELDS)
end
