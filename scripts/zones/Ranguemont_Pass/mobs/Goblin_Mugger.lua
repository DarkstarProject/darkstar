-----------------------------------
-- Area: Ranguemont Pass
--  Mob: Goblin Mugger
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 604, 1, dsp.regime.type.GROUNDS)
end;
