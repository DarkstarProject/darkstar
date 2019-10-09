-----------------------------------
-- Area: Gustav Tunnel
--  Mob: Doom Mage
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 765, 2, dsp.regime.type.GROUNDS)
end;