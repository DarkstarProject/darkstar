-----------------------------------
-- Area: Ranguemont Pass
--  Mob: Goblin Artificer
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 609, 2, dsp.regime.type.GROUNDS)
end;
