-----------------------------------
-- Area: Zeruhn Mines (172)
--   Mob: River_Crab
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobInitialize(mob)
end;

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 627, 1, dsp.regime.type.GROUNDS)
end;
