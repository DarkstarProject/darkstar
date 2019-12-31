-----------------------------------
-- Area: Labyrinth of Onzozo
--  Mob: Goblin Enchanter
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 771, 2, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 772, 2, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 774, 2, dsp.regime.type.GROUNDS)
end