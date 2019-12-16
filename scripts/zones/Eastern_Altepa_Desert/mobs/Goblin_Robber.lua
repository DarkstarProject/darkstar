-----------------------------------
-- Area: Eastern Altepa Desert
--  Mob: Goblin Robber
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 113, 2, dsp.regime.type.FIELDS)
end;
