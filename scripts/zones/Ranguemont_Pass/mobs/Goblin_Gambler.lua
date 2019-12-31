-----------------------------------
-- Area: Ranguemont Pass
--  Mob: Goblin Gambler
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 604, 2, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 605, 2, dsp.regime.type.GROUNDS)
end;
