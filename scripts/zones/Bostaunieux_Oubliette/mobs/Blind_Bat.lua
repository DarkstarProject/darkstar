-----------------------------------
-- Area: Bostaunieux Oubliette
--  Mob: Blind Bat
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 615, 1, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 617, 2, dsp.regime.type.GROUNDS)
end
