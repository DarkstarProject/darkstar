-----------------------------------
-- Area: Den of Rancor
--  Mob: Succubus Bats
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 799, 1, dsp.regime.type.GROUNDS)
end;