-----------------------------------
-- Area: Gustav Tunnel
--  Mob: Goblin Poacher
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 764, 3, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 765, 3, dsp.regime.type.GROUNDS)
end;