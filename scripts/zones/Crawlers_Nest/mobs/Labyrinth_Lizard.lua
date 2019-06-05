-----------------------------------
-- Area: Crawlers' Nest
--  MOB: Labyrinth Lizard
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 689, 1, dsp.regime.type.GROUNDS)
end;