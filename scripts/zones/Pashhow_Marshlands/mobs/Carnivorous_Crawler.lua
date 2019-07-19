-----------------------------------
-- Area: Pashhow Marshlands
--  Mob: Carnivorous Crawler
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 23, 1, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 24, 2, dsp.regime.type.FIELDS)
end
