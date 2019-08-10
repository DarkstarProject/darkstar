-----------------------------------
-- Area: Buburimu Peninsula
--  Mob: Carnivorous Crawler
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 33, 1, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 34, 2, dsp.regime.type.FIELDS)
end;
