-----------------------------------
-- Area: Kuftal Tunnel
--  MOB: Goblin Tamer
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 740, 2, dsp.regime.type.GROUNDS)
end