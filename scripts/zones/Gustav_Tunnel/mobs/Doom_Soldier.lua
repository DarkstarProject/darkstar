-----------------------------------
-- Area: Gustav Tunnel
--  Mob: Doom Soldier
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 765, 2, dsp.regime.type.GROUNDS)
end;