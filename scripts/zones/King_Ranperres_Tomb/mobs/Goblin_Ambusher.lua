-----------------------------------
-- Area: King Ranperres Tomb
--  Mob: Goblin Ambusher
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 631, 2, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 633, 1, dsp.regime.type.GROUNDS)
end