-----------------------------------
-- Area: Zeruhn Mines (172)
--   Mob: Ding_Bats
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobInitialize(mob)
end;

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 626, 1, dsp.regime.type.GROUNDS)
end;
