-----------------------------------
-- Area: Temple of Uggalepih
--  MOB: Rumble Crawler
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 791, 2, dsp.regime.type.GROUNDS)
end