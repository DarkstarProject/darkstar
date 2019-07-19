-----------------------------------
-- Area: Eastern Altepa Desert
--  Mob: Goblin Poacher
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 113, 1, dsp.regime.type.FIELDS)
end;
