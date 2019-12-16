-----------------------------------
-- Area: Rolanberry Fields
--  Mob: Poison Leech
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 85, 2, dsp.regime.type.FIELDS)
end
