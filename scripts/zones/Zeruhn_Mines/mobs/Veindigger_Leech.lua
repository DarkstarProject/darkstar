-----------------------------------
-- Area: Zeruhn Mines (172)
--   Mob: Veindigger Leech
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobInitialize(mob)
end;

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player,mob,630,2);
end;
