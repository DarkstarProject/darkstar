-----------------------------------
-- Area: Eastern Altepa Desert
--  MOB: Goblin Poacher
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 113, 1, dsp.regime.type.FIELDS)
end;
