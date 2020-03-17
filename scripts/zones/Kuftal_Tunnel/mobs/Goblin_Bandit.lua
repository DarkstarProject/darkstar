-----------------------------------
-- Area: Kuftal Tunnel
--  Mob: Goblin Bandit
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 740, 2, tpz.regime.type.GROUNDS)
end