-----------------------------------
-- Area: Yhoator Jungle
--  Mob: Goblin Bouncer
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 129, 2, dsp.regime.type.FIELDS)
end
