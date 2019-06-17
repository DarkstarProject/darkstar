-----------------------------------
-- Area: King Ranperres Tomb
--  MOB: Goblin Butcher
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 631, 2, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 633, 3, dsp.regime.type.GROUNDS)
end