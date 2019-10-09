-----------------------------------
-- Area: King Ranperres Tomb
--  Mob: Goblin Mugger
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 631, 2, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 635, 1, dsp.regime.type.GROUNDS)
end