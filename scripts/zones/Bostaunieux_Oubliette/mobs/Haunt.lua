-----------------------------------
-- Area: Bostaunieux Oubliette
--  MOB: Haunt
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 612, 2, dsp.regime.type.GROUNDS)
end
