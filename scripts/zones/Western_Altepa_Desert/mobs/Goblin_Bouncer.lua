-----------------------------------
-- Area: Western Altepa Desert
--  Mob: Goblin Bouncer
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 137, 1, dsp.regime.type.FIELDS)
end
