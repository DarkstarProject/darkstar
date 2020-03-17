-----------------------------------
-- Area: Western Altepa Desert
--  Mob: Goblin Bouncer
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 137, 1, tpz.regime.type.FIELDS)
end
