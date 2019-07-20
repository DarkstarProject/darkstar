-----------------------------------
-- Area: King Ranperres Tomb
--  Mob: Goblin Tinkerer
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 631, 2, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 633, 2, dsp.regime.type.GROUNDS)
end