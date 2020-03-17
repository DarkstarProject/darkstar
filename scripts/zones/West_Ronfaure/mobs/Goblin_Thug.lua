-----------------------------------
-- Area: West Ronfaure
--  Mob: Goblin Thug
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 56, 2, tpz.regime.type.FIELDS)
end
