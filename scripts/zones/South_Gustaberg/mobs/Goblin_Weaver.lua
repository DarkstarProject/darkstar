-----------------------------------
-- Area: South Gustaberg
--  Mob: Goblin Weaver
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 79, 1, dsp.regime.type.FIELDS)
end
