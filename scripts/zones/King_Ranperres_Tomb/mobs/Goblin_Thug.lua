-----------------------------------
-- Area: King Ranperres Tomb
--  Mob: Goblin Thug
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 631, 2, tpz.regime.type.GROUNDS)
end