-----------------------------------
-- Area: Den of Rancor
--  MOB: Tonberry Beleaguerer
-----------------------------------
mixins = {require("scripts/mixins/families/tonberry")}
require("scripts/globals/regimes")

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 798, 1, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 799, 2, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 800, 2, dsp.regime.type.GROUNDS)
end;
